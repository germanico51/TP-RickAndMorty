class Rick {
	const familia =[new Morty(),new Beth(),new Summer(),new Jerry()]
	var property acompaniantes = []
	var property nivelDemencia=0 
	
	method estaSolo(){
		var solo=false;
		if(acompaniantes.size()==0){
			solo = true
		}
		 return solo ;
	}
	method aumentarDemencia(cant){
		nivelDemencia += cant
	}
	method disminuirDemencia(cant){
		nivelDemencia -= cant
	}
	method irseDeAventura(){
		var resp;
		if(!self.estaSolo() && nivelDemencia<=100 ){
			resp="I'm gone";
			acompaniantes.forEach({acompaniante => acompaniante.efectoAventura(self)})
			
		}else{
			self.disminuirDemencia(self.nivelDemencia()/2)
			resp="Soy un pepinillo"
		}
		return  resp
	}	

	method asignarAcompaniante(){
			if ((!familia.isEmpty())) {
			acompaniantes.add(familia.anyOne())
		}
	}
			
	}
class Familiar {
	var saludMental=0
	var afecto=0
	var mensaje
	method aumentarAfecto(cant){
		afecto += cant
	}
	
	method disminuirSaludMental(cant){
		saludMental -= cant
	}
	method efectoAventura(unRick){
	
	mensaje="efecto aplicado"
	 return mensaje;
	}
}

class Morty inherits Familiar{
	override method efectoAventura (unRick){
 		self.disminuirSaludMental(30)
 		unRick.aumentarDemencia(50)
 		return mensaje		
	}
}

class Beth inherits Familiar{
	override method efectoAventura (unRick){
		
			self.aumentarAfecto(10)
			unRick.disminuirDemencia(20)
 			return mensaje	
	}
}
class Summer inherits Familiar{
	method esMiercoles(){
		const hoy = new Date();
		var miercoles=false;
		if(hoy.internalDayOfWeek()==3){
			miercoles=true;
		}
		return miercoles;
	}
	
	override method efectoAventura (unRick){
		if(self.esMiercoles() ) {
			
 			self.aumentarAfecto(10)
 			 unRick.disminuirDemencia(20)
 			}else{
 				mensaje = "Solo los miercoles puedo ir de aventura";
 			}
 			return mensaje
	}
}
class Jerry inherits Familiar{
	override method efectoAventura (unRick){
		mensaje =  "soy muy tonto y no puedo ir de aventura";
		return mensaje;
	}
}