def read file, pestaña=0
	
	#Abro el Archivo
	ods = Roo::Spreadsheet.open("./file/#{file[:filename]}")
	
	#Leo todos los registers del archivo
	registers = [].tap do |registers|
	  datos = ods.sheet(pestaña).parse
	  datos.each do |register|
	  	arr = register[0].scan(/\w+/)
	  	piso = arr.shift
	  	prop = arr.join ' '
		  registers << {propietario: prop, piso: piso, unidad:register[1].to_i,
		  	expensa: register[2].to_f, extraordinaria: register[3].to_f,
		  	total: register[4].to_f}
		end
	end
end