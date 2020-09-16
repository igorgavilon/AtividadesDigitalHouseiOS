//
//  Item.swift
//  ListaCompras
//
//  Created by Igor Gavilon on 16/09/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import Foundation

class Item{
    private var nome: String
    private var quantidade: Int
    
    init(nome: String, quantidade: Int) {
        self.nome = nome
        self.quantidade = quantidade
    }
    
    func getNome() -> String{
        return self.nome
    }
    
    func setNome(nome: String){
        self.nome = nome
    }
    
    func getQuantidade() -> Int{
        return self.quantidade
    }
    
    func setQuantidade(quantidade: Int){
        self.quantidade = quantidade
    }
}
