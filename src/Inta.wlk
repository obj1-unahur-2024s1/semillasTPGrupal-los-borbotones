import platas.*
import parcelas.*

object inta {
	
	const property parcelas=[]
	
	method cantidadDeParcelasExistentes(){
		return self.parcelas().size()
	}
	method sumaTotalDePlantas()=
		parcelas.sum({p=> p.cantidadDePlantas()})
	method promedioDePlantas()=
		self.sumaTotalDePlantas() / self.cantidadDeParcelasExistentes()
	
	method parcelasConMasDe4Plantas()=
		parcelas.filter({p=> p.cantidadDePlantas()>4})	
		
	method parcelaMasAutosustentable()=
		self.parcelasConMasDe4Plantas().max({p=> p.porcentajeDePlantasBienAsociadas()})
		 
}


