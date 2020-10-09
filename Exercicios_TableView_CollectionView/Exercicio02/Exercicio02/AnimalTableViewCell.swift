//
//  AnimalTableViewCell.swift
//  Exercicio02
//
//  Created by Igor Gavilon on 07/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelRaca: UILabel!
    @IBOutlet weak var labelPeso: UILabel!
    @IBOutlet weak var labelEspecie: UILabel!
    
    func setup(animal: Animal){
        labelNome.text = animal.nome
        labelRaca.text = animal.raca
        labelPeso.text = String(animal.peso)
        labelEspecie.text = animal.especie
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
