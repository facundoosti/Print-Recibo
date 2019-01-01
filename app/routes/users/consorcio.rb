# encoding: utf-8

module PrintRecibos
  class App
    namespace '/consorcios' do

      #GET index
      get do
        haml :'recibo/index', locals:{recibo:{}}
        haml :'consorcios/index', locals:{consorcios: Consorcio.all}
      end

      #GET new
      get '/new' do
        haml :'consorcios/new', locals:{ consorcio: Consorcio.new}
      end

      #GET edit
      get '/:id/edit' do
        consorcio = Consorcio.find(params[:id])
        haml :'consorcios/edit',locals:{consorcio:consorcio}
      end

      #GET show
      get '/:id/show' do
        consorcio = Consorcio.find(params[:id])
        haml :'consorcios/show',locals:{consorcio:consorcio}
      end

      post do
        consorcio = Consorcio.new params[:consorcio]
        begin
          if consorcio.save
            flash[:notice] = 'El Consorcio ha sido Creado.'
          else
            flash[:error] = error_message
          end
        rescue Exception => e
          flash[:error] = e.message
        end
        redirect :'/consorcios'
      end

      put '/:id' do
        consorcio = Consorcio.find params[:id]
        begin
          if consorcio.update_attributes(params[:consorcio])
            flash[:notice] = 'El Consorcio ha sido Modificado.'
          else
            flash[:error] = error_message
          end
        rescue Exception => e
          flash[:error] = e.message
        end
        redirect :'/consorcios'
      end

      delete '/:id/delete' do
        begin
          consorcio = Consorcio.find params[:id]
          consorcio.destroy
          flash[:notice] = 'Consorcio borrado.'
        rescue Exception => e
          flash[:error] = e.message
        end
        redirect :'/consorcios'
      end
    end
  end
end
