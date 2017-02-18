class ImprimirRecibos < Prawn::Document

  def initialize(registers=nil,periodo=nil,vencimiento=nil, detalle=nil, valor)
    super()
    font_size 10
    info = {
      consorcio: {
        nombre: 'estado de israel 4671',
        ciudad: 'capital federal'
      },
      periodo: mes(periodo.month).capitalize,
      vencimiento: vencimiento.strftime('%d/%m/%Y'),
      detalle: detalle.upcase,
      text:   <<-eos
                No acredita el pago de deudas
                ateriores, si las hubiere y esta
                sujeto a su posterior reajuste
              eos
    }
    
    main registers, info, valor
  end

  private
  
  def main recibos, info, valor

    recibos.each do |recibo|
      #recibo = recibos.first
      vtotal = (valor ? recibo[:extraordinaria] : recibo[:expensa])

      total = make_table([ ["TOTAL"], [vtotal] ],cell_style:{ font_style: :bold, height: 30,align: :center},column_widths: [55],row_colors: ["FFFFFF", "8C8C8C"] )
      cheque = make_table([ ['CHEQUE N°'], ['C/BANCO'] ],cell_style:{ font_style: :bold, height: 30},column_widths: [180] )
      fp = make_table([ ['Fecha de Pago'] ],cell_style:{ font_style: :bold,align: :center, height: 30},column_widths: [140])
      
      theader = [[ "#{info[:consorcio][:nombre]} \n #{info[:consorcio][:ciudad]}".upcase, info[:periodo], info[:vencimiento], recibo[:piso], recibo[:unidad] ]]
      
      tmedium = [[ 'DETALLE', 'IMPORTE', "RECIBI DE:      #{recibo[:propietario].upcase}" ],
                [{content: "#{info[:detalle]}".upcase }, vtotal, "LA SUMA DE:    #{numero_a_palabras(vtotal).upcase} CON #{decimal_to_s(vtotal)}"]]
      
      table([ [ 'CONSORCIO', 'PERIODO', 'VTO', 'PISO', 'UNID.' ]],column_widths: [200, 110, 110, 50, 50], cell_style:{ font_style: :bold })
      table theader,column_widths: [200, 110, 110, 50, 50]
      table [['recibo autorizado'.upcase]],column_widths: [520],cell_style:{background_color:"8C8C8C", align: :center, size: 12, font_style: :bold }
      table tmedium ,column_widths: [145, 55, 320],cell_style:{ font_style: :bold}
      table [[info[:text], total, cheque, fp ]],column_widths: [145, 55,180,140]
      move_down 60
    end

  end
end

