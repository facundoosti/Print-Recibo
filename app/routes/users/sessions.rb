# encoding: utf-8

module PrintRecibos
  class App

    namespace '/sessions' do

      get '/login' do
        haml :'sessions/login', :layout => :login_layout
      end

      get '/logout' do
        logout(AdminUser)
        redirect '/'
      end

      post '/login' do
        if params[:username].present? || params[:password].present?
          if login(AdminUser, params[:username], params[:password])
            remember(authenticated(AdminUser)) if params[:remember]
            flash[:notice] = "Bienvenido - #{sala.name} " 
            redirect(params[:return] || '/')
          else
            flash[:error] = 'Incorrect Password or User Name'
            redirect(params[:return] || '/')
          end
          flash[:error] = 'Name or Password are incorrect.'
          redirect :'/sessions/login'
        end 
      end
    
    end
  end
end
