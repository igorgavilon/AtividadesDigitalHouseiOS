import UIKit

class Fabrica{
    //método estático, pertence à fábrica
    //não há a necessidade de instanciar um objeto do tipo Fabrica para utilizá-lo
    //neste caso, como não existem várias fábricas, optei por não criar instâncias
    public static func getBonificacao(unidadesVendidas: Int, estoqueLoja: Int) -> Int{
        //se o estoque da loja foi todo vendido, ela ganha 2 carros de bonificação
        if estoqueLoja == 0{
            return 2
        }else if unidadesVendidas >= 5 {
            //se a loja vender 5 unidades ou mais de uma só vez
            //ganha 1 carro de bonificação
            return 1
        }else{
            //caso contrário, não tem direito à bonificação
            return 0
        }
        
    }
}


class LojaCarros{
    var nome: String
    private var estoque: Int
    
    init(nome: String, estoque: Int) {
        self.nome = nome
        self.estoque = estoque
    }
    
    func getEstoque() -> Int{
        return self.estoque
    }
    
    private func setEstoque(estoque: Int){
        self.estoque = estoque
    }
    
    func vender(unidadesVendidas: Int){
        let estoqueAtual: Int
        let bonificacao: Int
        
        estoqueAtual = getEstoque()
        //se o número de unidades vendidas é menor do que o estoque atual
        if (estoqueAtual - unidadesVendidas) >= 0 {
            print("A loja \(self.nome) vendeu \(unidadesVendidas) carro(s).")
            print("Fica com \(estoqueAtual - unidadesVendidas).")
            bonificacao = Fabrica.getBonificacao(unidadesVendidas: unidadesVendidas,estoqueLoja: (estoqueAtual - unidadesVendidas))
            setEstoque(estoque: estoqueAtual - unidadesVendidas + bonificacao)
            

        }else{
            //o estoque nunca pode ser negativo
            //então, o cliente só pode comprar no máximo o número de carros que há no estoque atual!!
            print("A loja \(self.nome) vendeu \(estoqueAtual) carro(s).")
            print("Fica com 0.")
            bonificacao = Fabrica.getBonificacao(unidadesVendidas: estoqueAtual,estoqueLoja: 0)
            setEstoque(estoque: bonificacao)
        }
        //se a loja ganhou alguma bonificação da fábrica, informar
        if bonificacao > 0 {
            print("A loja \(self.nome) ganhou \(bonificacao) carro(s) de bonificação da fábrica.")
        }
    }
    
}


var minhaLoja = LojaCarros(nome: "Venda Certa", estoque: 50)
print("Nome da loja de carros: \(minhaLoja.nome).")
print("Estoque inicial: \(minhaLoja.getEstoque())")
minhaLoja.vender(unidadesVendidas: 1)
print("Estoque atual: \(minhaLoja.getEstoque())")
print("----------------------")
minhaLoja.vender(unidadesVendidas: 5)
print("Estoque atual: \(minhaLoja.getEstoque())")
print("----------------------")
minhaLoja.vender(unidadesVendidas: 44)
print("Estoque atual: \(minhaLoja.getEstoque())")
print("----------------------")
minhaLoja.vender(unidadesVendidas: 2)
print("Estoque atual: \(minhaLoja.getEstoque())")
print("----------------------")
//exemplo de quando tentamos comprar mais unidades
//do que a loja tem no estoque!
minhaLoja.vender(unidadesVendidas: 10)
print("Estoque atual: \(minhaLoja.getEstoque())")
print("----------------------")
