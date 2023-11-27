// Compara cada caracter de la cadena ingresada por el usuario.
// Parámetros: cadena Ingresada por consola
// Retorna: VERDADERO si todos los caracteres cumplen la condición de un número.
// 			FALSO si al menos un caracter no forma la estructura de un número, (excepto (-), (+) y (.) que hacen parte de un número.
Funcion esNumero <- validarSiEsNumero ( cadenaIngresada )	
	Definir tamanioCadena, posicionCaracter Como Entero
	Definir caracterCadena Como Caracter
	Definir esNumero Como Logico	
	
	tamanioCadena = Longitud(cadenaIngresada)	
	contadorPuntos = 0
	Para posicionCaracter <- 0 Hasta tamanioCadena-1 Hacer
		caracterCadena = SubCadena(cadenaIngresada, posicionCaracter, posicionCaracter)		
		esNumero = Falso
		Si caracterCadena = "." Entonces
			contadorPuntos <- contadorPuntos + 1
		SiNo			
			Si (caracterCadena = "+" O caracterCadena = "-") 
				esNumero = Verdadero
				// Si el menos (-) o el más (+) están después del primer dígito, no es un número
				Si posicionCaracter > 0 Entonces
					esNumero = Falso
					posicionCaracter <- tamanioCadena
				FinSi			
			SiNo
				// Compara si el caracter evaluado coincide con un dígito
				Para digito = 0 Hasta 9 Hacer					
					Si ConvertirATexto(digito) = caracterCadena Entonces
						esNumero <- Verdadero
						digito <- 9						
					FinSi					
				Fin Para
				// Si el caracter evaluado no cumple las condiciones anteriores, la cadena ingresada no representa un número
				Si esNumero = Falso Entonces
					esNumero <- Falso
					posicionCaracter <- tamanioCadena
				FinSi	
			FinSi
		FinSi
		// Si existe más de un punto en la cadena ingresada, no representa un número
		Si contadorPuntos > 1 Entonces
			esNumero <- Falso
			posicionCaracter <- tamanioCadena-1
		FinSi		
	Fin Para	
Fin Funcion

Algoritmo validarSiEsUnNumero_Version2
	Definir cadenaIngresada Como Caracter
	Definir numeroReal, numeroValidado Como Real
	Definir esNumero Como Logico
	
	numeroReal = 10.5
	
	Escribir "Ingrese un número: "
	Leer cadenaIngresada
	
	esNumero <- validarSiEsNumero ( cadenaIngresada )
	
	Si esNumero Entonces
		numeroValidado <- ConvertirANumero(cadenaIngresada)
		Escribir ""
		Escribir "** Prueba de conversión **" 
		Escribir "-> Sumar " numeroValidado " + " numeroReal " = " numeroValidado + numeroReal
	SiNo
		Escribir ""
		Escribir cadenaIngresada " No es un número"
	FinSi	
FinAlgoritmo
