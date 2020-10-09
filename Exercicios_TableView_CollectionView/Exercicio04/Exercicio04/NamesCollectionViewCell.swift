//
//  NamesCollectionViewCell.swift
//  Exercicio04
//
//  Created by Igor Gavilon on 08/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class NamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    func setLabelName(name: String){
        self.labelName.text = name
    }
}
