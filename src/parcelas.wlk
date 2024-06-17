import platas.*

class Parcela{
	var ancho
	var largo
	const property hsDeSol
	const property plantas=#{}
	
	method superficie()= ancho*largo
	method cantidadMaximaDePlantas()=
		if(ancho>largo){self.superficie()/5} else {self.superficie()/3 + largo}
	method tieneComplicaciones()=
		plantas.any({p=> p.hsDeSolQueTolera()< hsDeSol})
	method plantarUnaPlanta(unaplanta){
		if (plantas.size()== self.cantidadMaximaDePlantas()){
			self.error("se supero la cantidad maxima de plantas")
		}
		if (hsDeSol-unaplanta.hsDeSolQueTolera()>=2){
			self.error("recibe 2hs o mas de sol que lo que tolera la planta")
		}
		plantas.add(unaplanta)
	}
	method cantidadDePlantas(){
		return self.plantas().size()
	}
	method seAsociaBien(unaPlanta)// metodo abstracto
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta)=
		not self.tieneComplicaciones() and unaPlanta.leResultaIdeal(self)
		
	method cantidadDePlantasBienAsociadas()=
		plantas.count({p=>self.seAsociaBien(p)})
		
	method porcentajeDePlantasBienAsociadas()=
		(self.cantidadDePlantasBienAsociadas()*100)/self.cantidadDePlantas()
}
class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta)=
		self.plantas().size()<=2 and unaPlanta.esFuerte()
		
	method cantidadDePlantasBienAsociadas()=
		plantas.count({p=>self.seAsociaBien(p)})
		
	method porcentajeDePlantasBienAsociadas()=
		(self.cantidadDePlantasBienAsociadas()*100)/self.cantidadDePlantas()
}