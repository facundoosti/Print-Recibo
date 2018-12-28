# encoding: utf-8

module PrintRecibos
  class Base < Sinatra::Base

    configure do

      # Directory Structure
      set :root, File.expand_path('../../', __FILE__)#Dir.pwd
      set :public_folder, File.dirname(__FILE__) + '/public'
      set :haml, format: :html5, layout: :'layout/layout'

      # view statics & flash
      use Rack::Static, urls: ['/css', '/js', '/fonts', '/img', '/system'], root: 'public'
      use Rack::Flash, :accessorize => [:notice, :error]

      #partial
      register Sinatra::Partial
      set :partial_template_engine, :haml
      enable :partial_underscores
      set :gmap_key, 'AIzaSyCeEg8IA3s1tgq7Xe64kBfPm7tMJR7VlEc'
    end

    Prawn::Font::AFM.hide_m17n_warning = true

    #Log
    file = File.new("log/#{ENV['RACK_ENV']}.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file

    configure :development do
      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
    end

    #Namespace
    register Sinatra::Namespace
    register Sinatra::ConfigFile

    set :protection, except: :session_hijacking

    configure :development do
      register Sinatra::Reloader
      also_reload 'app/models/*.rb'
      also_reload 'app/routes/**/*.rb'
      also_reload 'app/reports/**/*.rb'
    end

    enable :sessions, :logging, :method_override, :dump_errors
    set :session_secret, 'sdjgfuwy47digvdsf'

    # These will be available for all MyApp subclasses
    helpers do
      def base_url
        @base_url ||= "http://#{request.env['HTTP_HOST']}"
      end
    end

    # check if the spected_path_info is in the real_path_info
    # used to display a certain class in the menu buttons
    def is_in_current_path(real_path_info, spected_path_info)
      result = real_path_info =~ /#{spected_path_info}/
      !result.nil?
    end

    def current_path(options = {})
      if request.path.size > 3
        "/"+options[:lang]+request.path
      else
        "/"+options[:lang]
      end
    end

    def active_link?(route)
      request.path == route
    end

    def link_to(text, url=nil, options={}, &block)
      url, text = text, capture_haml(&block) if url.nil?
      url = url unless URI(url).scheme
      capture_haml do
        haml_tag :a, text, options.merge(:href => url)
      end
    end

    def is_this_url? url
      request.path_info.include? url
    end

    #FIXME: make a view
    not_found do
      "Not Found Base"
    end

    #FIXME: make a view
    error do
      "Error Base"
    end
  end

end
