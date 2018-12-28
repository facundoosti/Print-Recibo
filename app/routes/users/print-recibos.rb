# encoding: utf-8

module PrintRecibos
  class App

    post '/print-recibos' do
      registers = read(params[:file][:tempfile])
      begin
        content_type :'application/pdf'
        pdf = ImprimirRecibos.new(registers, data(params))
        pdf.render
      rescue Exception => e
        flash[:error]="Extension del archivo incorrecto.Debe ser xlsx o similar."
        redirect :'/'
      end
    end
  end
end
