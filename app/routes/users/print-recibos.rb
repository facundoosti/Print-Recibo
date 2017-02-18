# encoding: utf-8

module PrintRecibos
  class App

    post '/print-recibos' do

      registers = read(params['file']) 
      periodo = Date::strptime(params['month'], '%Y-%m')

      if params['expensa'] == 'false'
        vencimiento = (periodo.next_month + 9) 
        detalle = 'expensas'
        valor = false
      else
        vencimiento=(periodo.next_month + 19)
        detalle = 'adicional prevision mayores costos'
        valor = true
      end

      begin
        pdf = ImprimirRecibos.new registers, periodo, vencimiento, detalle, valor
        content_type :'application/pdf'
      rescue Exception => e
        flash[:error]="Formato de archivo incorrecto."
      end
      pdf.render
    end
  end
end
