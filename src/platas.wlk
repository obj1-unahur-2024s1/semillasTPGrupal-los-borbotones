
class Planta{
	const property anioDeObtencion
	var altura
	
	method altura()= altura
	
	method esFuerte()= self.hsDeSolQueTolera() > 10
	method daSemillas()= self.esFuerte() or self.condicionParaDarSemillas()
	//method espacioQueOcupa()
	method hsDeSolQueTolera()
	method condicionParaDarSemillas()
}

class Menta inherits Planta{
	override method hsDeSolQueTolera()= 6
	override method condicionParaDarSemillas()= altura>0.4
	method espacioQueOcupa()= altura* 3
	method leResultaIdeal(unaParcela)=
		unaParcela.superficie()> 6
}
class Hierbabuena inherits Menta{
	override method espacioQueOcupa()= super() * 2
}
class Soja inherits Planta{
	override method hsDeSolQueTolera()= 
		if(altura<0.5){6} else if(altura.between(0.5,1)){7} else {9}
	
	override method condicionParaDarSemillas()= anioDeObtencion> 2007 and altura>1
	method espacioQueOcupa()= altura/2
	method leResultaIdeal(unaParcela)=
		unaParcela.hsDeSol() == self.hsDeSolQueTolera()
}

class SojaTransgenica inherits Soja{
	override method daSemillas()= false
	override method leResultaIdeal(unaParcela)=
		unaParcela.cantidadMaximaDePlantas()== 1
}
class Quinoa inherits Planta{
	var hsDeSolQueTolera
	
	override method hsDeSolQueTolera()= hsDeSolQueTolera
	override method condicionParaDarSemillas()= anioDeObtencion< 2005
	method espacioQueOcupa()= 0.5
	method leResultaIdeal(unaParcela)=
		unaParcela.plantas().all({p=> p.altura()< 1.5})
	
}