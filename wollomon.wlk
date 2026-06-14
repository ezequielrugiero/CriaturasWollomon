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
}

class Eletrico inherits Criatura {
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