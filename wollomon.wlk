class Criatura {
    var nivel
    var puntoDeSalud = 200
    const ataques = [ ]

    method nivel()=nivel
    method puntoDeSalud()=puntoDeSalud
    method ataques()=ataques

    method apreder(unAtaque){
        ataques.add(unAtaque)
    }

    method olvidar(unAtaque){
        ataques.remove(unAtaque)
    }

    method puedeAtacar(){
        return puntoDeSalud > 10
    }

    method recibirAtaqueDe(unaCriatur){
        puntoDeSalud = puntoDeSalud - unaCriatur.dañoQueEfectua()
    }

    method atacarA(unaCriatura){
        unaCriatura.recibirAtaqueDe(self) 
        self.condicionAdicional()

    }
    
    method condicionAdicional()

    method aumentarSalud(unaCantidad){
        puntoDeSalud = puntoDeSalud + unaCantidad
    }
}

class Ataques {
    var valorDeDaños 
    const nombre
    const tipo

    method valorDeDaños()=valorDeDaños
    method nombre()=nombre
    method tipo()=tipo
}

class Bicho inherits Criatura {
    method dañoQueEfectua(){
      return  ataques.sum({a=>a.valorDeDaños()})
    }

    override method condicionAdicional(){
        nivel = nivel + 10
    }

}

class Dragón inherits Criatura {
    var fuegoInterior

    method fuegoInterior()=fuegoInterior
    
    override method puedeAtacar(){
        return super () and fuegoInterior > 20
    }
    method dañoQueEfectua(){
      return  fuegoInterior + self.sumejorAtaque()
    }
// "map" este mento me traforma la lista de objeto, en una lista de numeros,
// luego el .max me devuelve el maximo valor.
    method sumejorAtaque(){
        return ataques.map({a=>a.valorDeDaños()}).max()
    }

    override method condicionAdicional(){
        nivel = nivel + (fuegoInterior/2)
    }
}

class Eletrico inherits Criatura {
    // es necesario que cree un objeto que le diga la humeda actual o se puedo pasar como variable?
    var humedadDelAmbiente
    

    method estaCargado(){
        return self.humedadDelAmbiente() > 97
    }

    method humedadDelAmbiente(){
        return humedadDelAmbiente
    }
    method cambioLa(humedad){
        humedadDelAmbiente = humedad
    }

    override method puedeAtacar(){
        return super()  and self.estaCargado()
    }

    method dañoQueEfectua(){
      return  ataques.first().valorDeDaños()
    }

    method modificarnivel(){
        nivel = nivel - 1
    }

    override method recibirAtaqueDe(unaCriatura){
         super(unaCriatura) 
         self.modificarnivel()
    } 

    override method condicionAdicional(){
        if(self.estaCargado()){
            nivel = nivel + 20
        } 
    }

}

class Legendario inherits Dragón {
    var insigniaActual

    method insigniaActual()=insigniaActual
    method cambiaDe(insignia){
        insigniaActual = insignia
    }

    override method dañoQueEfectua(){
      return  super() +  insigniaActual.aumentarDañoDe(self)
    }

}

object insigniaRoja{
    method aumentarDañoDe(unDragon){
        if(unDragon.fuegoInterior()>20){
            return 10
        } else {return 5}

    }
}

object insigniaAzul{
    method aumentarDañoDe(unDragon){
        return 8
    }
}

object insigniaVerde{
    method aumentarDañoDe(unDragon){
        return 0
    }
}