//
//  CarCollectionViewCell.swift
//  Exercicio03
//
//  Created by Igor Gavilon on 07/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    
    public func setup(car: Car){
        self.imageView.image = UIImage(named: car.image)
        self.labelNome.text = car.nome
    }
}
