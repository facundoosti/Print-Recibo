class ImprimirRecibos < Prawn::Document

  def initialize(registers=nil,info)
    super()
    font_size 10
    main registers, info
  end

  private

  def main recibos, info

    recibos.each do |recibo|
      vtotal = (info[:valor] ? recibo[:extraordinaria] : recibo[:expensa])

      total = make_table([ ["TOTAL"], [vtotal] ],cell_style:{ font_style: :bold, height: 30,align: :center},column_widths: [55],row_colors: ["FFFFFF", "8C8C8C"] )
      cheque = make_table([ ['CHEQUE N°'], ['C/BANCO'] ],cell_style:{ font_style: :bold, height: 30},column_widths: [180] )
      fp = make_table([ ['Fecha de Pago'] ],cell_style:{ font_style: :bold,align: :center, height: 30},column_widths: [140])

      theader = [[ "#{info[:consorcio][:nombre]} \n #{info[:consorcio][:ciudad]}".upcase, info[:periodo], info[:vencimiento], recibo[:piso], recibo[:unidad] ]]

      table([ [ 'CONSORCIO', 'PERIODO', 'VTO', 'PISO', 'UNID.' ]],column_widths: [200, 110, 110, 50, 50], cell_style:{ font_style: :bold })
      table theader,column_widths: [200, 110, 110, 50, 50]
      table [['recibo autorizado'.upcase]],column_widths: [520],cell_style:{background_color:"8C8C8C", align: :center, size: 12, font_style: :bold }
      table [[ 'DETALLE', 'IMPORTE', "RECIBI DE:      #{recibo[:propietario].upcase}" ]] ,column_widths: [145, 55, 320],cell_style:{ font_style: :bold}
      fraccion = " CON #{decimal_to_s(vtotal)}" unless vtotal.modulo(1).zero?
      table [[{content: "#{info[:detalle]}".upcase }, vtotal, "LA SUMA DE:    #{numero_a_palabras(vtotal).upcase}#{fraccion}"]] ,column_widths: [145, 55, 320],cell_style:{ font_style: :bold, height: 70}
      table [[info[:text], total, cheque, fp ]],column_widths: [145, 55,180,140]

      text_box "Sello y Firma", at: [330, cursor + 70],
                                         width: 150,
                                         align: :right,
                                         size: 8

      stroke do
       horizontal_line 420, 490, :at => [cursor + 75]
      end

      move_down 10
    end

  end
end

