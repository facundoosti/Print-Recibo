def numero_a_palabras(numero)
  de_tres_en_tres = numero.to_i.to_s.reverse.scan(/\d{1,3}/).map{|n| n.reverse.to_i}

  millones = [
    {true => nil, false => nil},
    {true => 'millon', false => 'millones'},
    {true => "billon", false => "billones"},
    {true => "trillon", false => "trillones"}
  ]

  centena_anterior = 0
  contador = -1
  palabras = de_tres_en_tres.map do |numeros|
    contador += 1
    if contador%2 == 0
      centena_anterior = numeros
      [centena_a_palabras(numeros), millones[contador/2][numeros==1]].compact if numeros > 0
    elsif centena_anterior == 0
      [centena_a_palabras(numeros), "mil", millones[contador/2][false]].compact if numeros > 0
    else
      [centena_a_palabras(numeros), "mil"] if numeros > 0
    end
  end

  palabras.compact.reverse.join(' ')
end


def centena_a_palabras(numero)
  especiales = {
    11 => 'once', 12 => 'doce', 13 => 'trece', 14 => 'catorce', 15 => 'quince',
    10 => 'diez', 20 => 'veinte', 100 => 'cien'
  }
  if especiales.has_key?(numero)
    return especiales[numero]
  end

  centenas = [nil, 'ciento', 'doscientos', 'trescientos', 'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos']
  decenas = [nil, 'dieci', 'veinti', 'treinta', 'cuarenta', 'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa']
  unidades = [nil, 'un', 'dos', 'tres', 'cuatro', 'cinco', 'seis', 'siete', 'ocho', 'nueve']

  centena, decena, unidad = numero.to_s.rjust(3,'0').scan(/\d/).map{|i| i.to_i}

  palabras = []
  palabras << centenas[centena]

  if especiales.has_key?(decena*10 + unidad)
    palabras << especiales[decena*10 + unidad]
  else
    tmp = "#{decenas[decena]}#{' y ' if decena > 2 && unidad > 0}#{unidades[unidad]}"
    palabras << (tmp.empty? ? nil : tmp)
  end

  palabras.compact.join(' ')
end

def mes(nro)
  meses = %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)
  meses[nro - 1]
end

def decimal_to_s num
  (num.modulo(1)*100).round.to_s << "/100"
end
