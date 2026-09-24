class Corsa{
  const capacidad = 4
  const velocidadMaxima= 150
  const peso = 1300

  const color

  method color() {
    return color
  }

  method capacidad() {
    return capacidad
  }

  method velocidadMaxima() {
    return velocidadMaxima
  }

  method peso() {
    return peso
  }
}

class Kwid{
  const color= "azul"
  var tieneTanqueAdicional= false
  const peso= 1200
  const combustible= "gas"

  method color() {
    return color
  }
  method agregarTanque() {
    tieneTanqueAdicional= true
  }

  method quitarUnTanque() {
    tieneTanqueAdicional= false
  }

  method velocidadMaxima() {
    if (self.tieneTanqueAdicional()){
      return 120
    }else{
      return 110
    }
  }

  method peso() {
    if (self.tieneTanqueAdicional()){
      return peso + 150
    }else{
      return peso
    }
  }
  method capacidad() {
    if (self.tieneTanqueAdicional()){
      return 3
    }else{
      return 4
    }
  }
  method tieneTanqueAdicional() {
    return tieneTanqueAdicional
  }

}

object trafic {
  var interior= interiorComodo
  var motor= motorPulenta
  const color= "blanco"
  
  method color() {
    return color
  }
  method capacidad() {
    return interior.capacidad()

  }

  method velocidadMaxima() {
    return motor.velocidadMaxima()
  }

  method cambiarMotor(unMotor) {
    motor= unMotor
  }

  method cambiarInterior(unInterior) {
    interior= unInterior
  }

  method peso() {
      return 4000 + interior.peso() + motor.peso()
  }
}

object interiorComodo {
  method capacidad() {
    return 5
  }
  method peso() {
    return 700
  }
}

object interiorPopular {
  method capacidad() {
    return 12
  }
  method peso() {
    return 1000
  }
}

object motorPulenta {
  method velocidadMaxima() {
    return 130
  }
  method peso() {
    return 800
  }
}

object motorBataton {
  method velocidadMaxima() {
    return 80
  }
  method peso() {
    return 500
  }
}

class Dependencia{
  const rodados= []
  var cantidadDeEmpleados= 50

  method agregarAFlota(unRodado) {
    rodados.add(unRodado)
  }
  method hayAlMenos3Rodados() {
    return rodados.size() >= 3
  }
  method losRodadosVanAMasde100() {
    return rodados.all({unRodado => unRodado.velocidadMaxima() >= 100})
  }
  method estaBienEquipado() {
    return self.hayAlMenos3Rodados() and self.losRodadosVanAMasde100()
  }
  method rodadosDeColor(unColor) {
    return rodados.filter({unRodado => unRodado.color() == unColor})
  }
  method capacidadTotalEnColor(unColor) {
    return self.rodadosDeColor(unColor).sum({unRodado => unRodado.capacidad()})
  }
  method colorDelRodadoMasRapido() {
    return rodados.max({unRodado => unRodado.velocidadMaxima()}).color()
  }
  method capacidadTotalDeRodados() {
    return rodados.sum({unRodado => unRodado.capacidad()})
  }
  method capacidadFaltante() {
    return cantidadDeEmpleados - self.capacidadTotalDeRodados()
  }
  method cantidadDeRodados() {
    return rodados.sum({unRodado => unRodado})
  }
  method esGrande() {
    return cantidadDeEmpleados >= 40 and self.cantidadDeRodados()
  }

  method cambiarCantidadDeEmpleados(unaCantidad) {
    cantidadDeEmpleados= unaCantidad
  }
}

