import UIKit
//EXERCÍCIOS FUNCIONÁRIOS::POLIMORFISMO
class Funcionario{
    var nome: String
    var cpf: String
    var salario: Float
    
    init(nome: String, cpf: String, salario: Float) {
        self.nome = nome
        self.cpf = cpf
        self.salario = salario
    }
    
    func calcularBonusAnual()-> Float{
        return salario*12
    }
}

class Programador: Funcionario{
    var plataformaPreferida: String
    
    init(nome: String, cpf: String, salario: Float, plataformaPreferida: String) {
        self.plataformaPreferida = plataformaPreferida
        super.init(nome: nome, cpf: cpf, salario: salario)
    }
    
    override func calcularBonusAnual() -> Float {
        return super.calcularBonusAnual()*0.2
    }
}

class Designer: Funcionario{
    var ferramentaPreferida: String
    
    init(nome: String, cpf: String, salario: Float, ferramentaPreferida: String) {
        self.ferramentaPreferida = ferramentaPreferida
        super.init(nome: nome, cpf: cpf, salario: salario)
    }
    
    override func calcularBonusAnual() -> Float {
        return super.calcularBonusAnual()*0.15
    }
}

//EXERCÍCIO VEÍCULOS::POLIMORFISMO
class Veiculo{
    var cor: String
    var preco: Float
    var qtdPassageiros: Int
    
    init(cor: String, preco: Float, qtdPassageiros: Int) {
        self.cor = cor
        self.preco = preco
        self.qtdPassageiros = qtdPassageiros
    }
    
    func calculaQtdCombustivel(distanciaKm: Float) -> Float{
        return Float(qtdPassageiros) * distanciaKm
    }
}

class Carro: Veiculo{
    var tamanhoRodas: Float
    
    init(cor: String, preco: Float, qtdPassageiros: Int, tamanhoRodas: Float) {
        self.tamanhoRodas = tamanhoRodas
        super.init(cor: cor, preco: preco, qtdPassageiros: qtdPassageiros)
    }
    
    override func calculaQtdCombustivel(distanciaKm: Float) -> Float{
        return super.calculaQtdCombustivel(distanciaKm: distanciaKm) * self.tamanhoRodas
    }
}

class Aviao: Veiculo{
    var piloto: String
    var companhiaAerea: String
    
    init(cor: String, preco: Float, qtdPassageiros: Int, piloto: String, companhiaAerea: String) {
        self.piloto = piloto
        self.companhiaAerea = companhiaAerea
        super.init(cor: cor, preco: preco, qtdPassageiros: qtdPassageiros)
    }
    
    //a classe aviao tem a mesma implementacao do método que a super classe
    //por isso é só chamar a funcao calculaQtdCombustivel do pai
}
