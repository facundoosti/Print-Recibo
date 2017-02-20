def read file, pestaña=0
	
	#Abro el Archivo
	ods = Roo::Spreadsheet.open("./file/#{file[:filename]}")
	
	#Leo todos los registers del archivo
	registers = [].tap do |registers|
	  datos = ods.sheet(pestaña).parse
	  datos.each do |register|
		  registers << {propietario: register[0].to_s, piso: register[1].to_s, unidad:register[2].to_i,
		  	expensa: register[3].to_f, extraordinaria: register[4].to_f,
		  	total: register[5].to_f}
		end
	end
end