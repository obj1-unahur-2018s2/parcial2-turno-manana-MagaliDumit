import socios.*

class Viajes {
	var property idiomas = #{}
	var property implicaEsfuerzo = true
	var property sirveBroncearse = true
	var property duracion = 0
	method esInteresante() { return idiomas.size() >= 1 }
	method esRecomendada(socio) {return  self.esInteresante() and
		socio.leAtrae(self) and not socio.actividadesRealizo()
	}
	 
} 

class ViajesPlaya inherits Viajes {
	var property largoPlaya = 0
	method duracion() {return largoPlaya/500 }
	method implicaEsfuerzo() { return largoPlaya >= 1200}
	method sirveBroncearse() {return  true}
	
}

class ExcurcionCiudad inherits Viajes{
	var property atracciones = 0
	
	method duracion() {return atracciones/2}
	method implicaEsfuerzo() {
		return atracciones.between(5,8)
	}
	method sirveBroncearse() {return  false}
	override method esInteresante() { 
		return super() or atracciones == 5}
}

class ExcurcionCiudadTropical inherits ExcurcionCiudad{
	override method duracion() {return super() +1}
	override method sirveBroncearse() {return  true }
	
}

class SalidaTrekking inherits Viajes {
	var property kmSenderos = 0
	var property diasSol = 0
	
	method duracion() {return kmSenderos/50}
	method implicaEsfuerzo() { return kmSenderos >= 80 }
	method sirveBroncearse() {return 
		diasSol >= 200 or 
		diasSol.between(100,200) and kmSenderos >= 120  }
	override method esInteresante() { 
		return super() and diasSol >= 140 }
}

class ClasesGimnasia {
	method idiomas() = #{"español"}
	method implicaEsfuerzo() = true
	method sirveBroncearse() = false
	method duracion() = 1
	method esRecomendada(socio) {return socio.edad().between(20,30)} 
	
}














