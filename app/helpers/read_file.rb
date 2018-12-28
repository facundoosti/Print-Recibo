def read(file, pestaña=0)
	#Abro el Archivo
	ods = Roo::Spreadsheet.open(file)

	#Leo todos los registers del archivo
  datos = ods.sheet(pestaña).parse
  datos.map do |register|
	  {
      propietario: register[0].to_s,
      piso: register[1].to_s,
      unidad:register[2].to_i,
	  	expensa: register[3].to_f.round(2),
      extraordinaria: register[4].to_f.round(2),
	  	total: register[5].to_f.round(2)
    }
	end
end

def data(params)
  {
    consorcio: Consorcios.find(params['consorcio_id']),
    periodo: mes(Date::strptime(params['month'], '%Y-%m').month).capitalize,
    vencimiento: Date.parse(params['vencimiento']).strftime('%d/%m/%Y'),
    detalle: params['detalle'].upcase,
    valor: params['expensa'] == true,
    text:   <<-eos
              No acredita el pago de deudas
              ateriores, si las hubiere y esta
              sujeto a su posterior reajuste
            eos
  }
end
