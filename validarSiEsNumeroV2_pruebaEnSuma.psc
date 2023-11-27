// Compara cada caracter de la cadena ingresada por el usuario.
// Par�metros: cadena Ingresada por consola
// Retorna: VERDADERO si todos los caracteres cumplen la condici�n de un n�mero.
// 			FALSO si al menos un caracter no forma la estructura de un n�mero, (excepto (-), (+) y (.) que hacen parte de un n�mero.
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
				// Si el menos (-) o el m�s (+) est�n despu�s del primer d�gito, no es un n�mero
				Si posicionCaracter > 0 Entonces
					esNumero = Falso
					posicionCaracter <- tamanioCadena
				FinSi			
			SiNo
				// Compara si el caracter evaluado coincide con un d�gito
				Para digito = 0 Hasta 9 Hacer					
					Si ConvertirATexto(digito) = caracterCadena Entonces
						esNumero <- Verdadero
						digito <- 9						
					FinSi					
				Fin Para
				// Si el caracter evaluado no cumple las condiciones anteriores, la cadena ingresada no representa un n�mero
				Si esNumero = Falso Entonces
					esNumero <- Falso
					posicionCaracter <- tamanioCadena
				FinSi	
			FinSi
		FinSi
		// Si existe m�s de un punto en la cadena ingresada, no representa un n�mero
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
	
	Escribir "Ingrese un n�mero: "
	Leer cadenaIngresada
	
	esNumero <- validarSiEsNumero ( cadenaIngresada )
	
	Si esNumero Entonces
		numeroValidado <- ConvertirANumero(cadenaIngresada)
		Escribir ""
		Escribir "** Prueba de conversi�n **" 
		Escribir "-> Sumar " numeroValidado " + " numeroReal " = " numeroValidado + numeroReal
	SiNo
		Escribir ""
		Escribir cadenaIngresada " No es un n�mero"
	FinSi	
FinAlgoritmo