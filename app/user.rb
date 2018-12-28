module PrintRecibos
  class App < PrintRecibos::Base

    # use Shield::Middleware, "/sessions/login"
    set :views, File.expand_path('../views/users', __FILE__)
    helpers Sinatra::ContentFor
    register Sinatra::ActiveRecordExtension

    helpers do
      def current_user
        authenticated(AdminUser)
      end

      #def require_sign_in
      #  error(401) unless authenticated(AdminUser) || request.path_info == "/sessions/login"
      #end

      def print_date(obj, date)
        date = obj.send(date)
        date.nil? ?  '-' : date.strftime("%d/%m/%Y")
      end

      def check_grid(data)
        capture_haml do
          if data
            haml_tag :i, :class => "glyphicon glyphicon-ok green"
          else
            haml_tag :i, :class => "glyphicon glyphicon-remove red"
          end
        end
      end

      def error_message
        "Un error ha Ocurrido."
      end
    end

    get '/' do
      haml :'layout/index', locals:{consorcios: Consorcios.all}
    end
  end
end
