//
//  Pessoa.swift
//  Exercicio01
//
//  Created by Igor Gavilon on 06/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import Foundation
import UIKit

class Pessoa{
    var nome: String
    var cargo: String
    var email: String
    
    init(nome: String, cargo: String, email: String) {
        self.nome = nome
        self.cargo = cargo
        self.email = email
    }
}
