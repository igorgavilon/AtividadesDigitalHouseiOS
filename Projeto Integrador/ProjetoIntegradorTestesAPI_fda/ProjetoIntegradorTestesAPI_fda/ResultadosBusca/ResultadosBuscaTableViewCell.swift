//
//  ResultadosBuscaTableViewCell.swift
//  ProjetoIntegradorTestesAPI_fda
//
//  Created by Igor Gavilon on 02/11/20.
//

import UIKit

class ResultadosBuscaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDrugName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(drug: Result){
        self.labelDrugName.text = drug.term
    }

}
