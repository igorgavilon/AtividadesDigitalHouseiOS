//
//  Animal.swift
//  Exercicio02
//
//  Created by Igor Gavilon on 07/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import Foundation

class Animal{
    var nome: String
    var raca: String
    var peso: Float
    var especie: String
    
    init(nome: String, raca: String, peso: Float, especie: String) {
        self.nome = nome
        self.raca = raca
        self.peso = peso
        self.especie = especie
    }
}
