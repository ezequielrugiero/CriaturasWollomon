import wollomon.*
class Toneros{
    const participante = #{}

    method agregarA(unParticipante){
        participante.add(unParticipante)
    }

    method echarA(unParticipante){
        participante.remove(unParticipante)
    }
    method todosAprende(unAtaque){
        participante.forEach({p=>p.apreder(unAtaque)})
    }

    method batallarEntreDos(priPnte, segPnte){
        priPnte.atacarA(segPnte)
    }

    method participanteConMayorNivel(){
        return participante.max({p=>p.nivel()})
    }

    method particpanteConMayorPS(){
        return participante.max({p=>p.puntoDeSalud()})
    }

    method batallaAutomatica(){
      if(self.participanteConMayorNivel() != self.particpanteConMayorPS()){  
        self.batallarEntreDos(self.participanteConMayorNivel(), self.particpanteConMayorPS()) }
     else {
      self.batallarEntreDos(self.participanteConMayorNivel(), self.elsegundoParticipanteConMayorSP())
        }
    }
    // este metod no me funciono
    // method elsegundoParticipanteConMayorSP(){
    //    return  participante.filter(!self.particpanteConMayorPS()).max({p=>p.puntoDeSalud()})
    // }

    method elsegundoParticipanteConMayorSP(){
        // guardo al participanete con mayor SP, una variable "priSP"
       const priSP= self.particpanteConMayorPS()
       // creo una lista discriminado al priSP, que tambien tengo que guardarla en una variable
       const listaRestante = participante.filter({p=> p != priSP})
        return listaRestante.max({p=>p.puntoDeSalud()})
    }

    method participanteConSaludBaja(){
      return  participante.filter({p=>p.puntoDeSalud()<50})
    }

    method darPocion(){
        return self.participanteConSaludBaja().forEach({p=>p.aumentarSalud(20)})
    }

}
 
