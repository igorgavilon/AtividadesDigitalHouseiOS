//
//  PessoaTableViewCell.swift
//  Exercicio01
//
//  Created by Igor Gavilon on 06/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import Foundation
import UIKit

class PessoaTableViewCell: UITableViewCell{
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCargo: UILabel!
    @IBOutlet weak var labelEmail: UILabel!

    func setup(pessoa: Pessoa){
        labelName.text = pessoa.nome
        labelCargo.text = pessoa.cargo
        labelEmail.text = pessoa.email
    }

    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
