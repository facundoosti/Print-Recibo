# encoding: utf-8

module PrintRecibos
  class App

    get '/consorcios' do
      haml :'consorcios/index', locals:{consorcios: Consorcios.all}
    end
    
    get '/consorcios/new' do
      haml :'consorcios/new', locals:{ consorcio: Consorcios.new}
    end
    
    get '/consorcios/:id/edit' do
      consorcio = Consorcios.find(params[:id])
      haml :'consorcios/edit',locals:{consorcio:consorcio}
    end
    
    post '/consorcios' do
      consorcio = Consorcios.new params[:consorcio]
      begin
        if consorcio.save
          flash[:notice] = "El Consorcio ha sido Creado."
        else
          flash[:error] = error_message
        end
      rescue Exception => e
        flash[:error] = e.message
      end
      redirect :'/consorcios'
    end

    put '/consorcios/:id' do
      consorcio = Consorcios.find params[:id]
      begin
        if consorcio.update_attributes(params[:consorcio])
          flash[:notice] = "El Consorcio ha sido Modificado."
        else
          flash[:error] = error_message
        end
      rescue Exception => e
        flash[:error] = e.message
      end
      redirect :'/consorcios'
    end

    delete '/consorcios/:id/delete' do
      begin
        consorcio = Consorcios.find params[:id]
        consorcio.destroy
        flash[:notice] = "Consorcio borrado."
      rescue Exception => e
        flash[:error] = e.message
      end 
      redirect "/consorcios"
    end
  end
end
