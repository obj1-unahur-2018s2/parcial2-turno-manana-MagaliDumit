import actividades.*

class Socios {
	var property edad = 0
	var property idiomas = #{}
	var property maximoActividades = 0
	var property actividadesRealizo = #{} 
	
	method realizarActividad(actividad) {
		  if (actividadesRealizo.size()< maximoActividades)
		 	{actividadesRealizo.add(actividad)
		 		
		 	} else self.error(" ya supero su capacidad maxima de actividades")
		 	}
		 	
	method adorarSol() {return  
		actividadesRealizo.all{ actividad => actividad.sirveBroncearse()}
	}
	method actividadesEsforzadas() {return
		 actividadesRealizo.filter{ actividad => actividad.implicaEsfuerzo()}}
	
} 

class SocioTranquilo inherits Socios { 
	method leAtrae(actividad) {return
		 actividad.duracion() == 4}
	}  
 
 
class SocioCoherente inherits Socios {
	method leAtrae(actividad) {
	if (self.adorarSol()) { actividad.sirveBroncearse() } 
	 actividad.implicaEsfuerzo() 
}}
 
class SocioRelajado inherits Socios {
	
	method leAtrae(actividad) {return
		idiomas.intersection(actividad.idiomas()) >= 1
	}
} 