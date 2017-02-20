# encoding: utf-8

module PrintRecibos
  class App

    post '/print-recibos' do

      begin
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

        pdf = ImprimirRecibos.new registers, periodo, vencimiento, detalle, valor, {nombre: params['nombre'],ciudad: params['ciudad']}
        content_type :'application/pdf'
        pdf.render
      rescue Exception => e
        flash[:error]="Extension del archivo incorrecto.Debe ser xlsx o similar."
        redirect :'/'
      end
    end
  end
end
