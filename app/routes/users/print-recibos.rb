# encoding: utf-8

module PrintRecibos
  class App

    post '/print-recibos' do

      begin
        filename = params[:file][:filename]
        file = params[:file][:tempfile]

        File.open("./file/#{filename}", 'wb') do |f|
          f.write(file.read)
        end

        registers = read(params['file']) 
        
        File.delete("./file/#{filename}")

        info = {
            consorcio: Consorcios.find(params['consorcio_id']),
            periodo: mes(Date::strptime(params['month'], '%Y-%m').month).capitalize,
            vencimiento: Date.parse(params['vencimiento']).strftime('%d/%m/%Y'),
            detalle: params['detalle'].upcase,
            valor: (params['expensa'] == 'false') ? false : true,
            text:   <<-eos
                      No acredita el pago de deudas
                      ateriores, si las hubiere y esta
                      sujeto a su posterior reajuste
                    eos
          }

        pdf = ImprimirRecibos.new registers, info
        content_type :'application/pdf'
        pdf.render
      rescue Exception => e
        flash[:error]="Extension del archivo incorrecto.Debe ser xlsx o similar."
        redirect :'/'
      end
    
    end
  end
end
