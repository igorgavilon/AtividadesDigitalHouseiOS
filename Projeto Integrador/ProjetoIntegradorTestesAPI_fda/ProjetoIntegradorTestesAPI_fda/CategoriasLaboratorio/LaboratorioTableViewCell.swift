//
//  LaboratorioTableViewCell.swift
//  ProjetoIntegradorTestesAPI_fda
//
//  Created by Igor Gavilon on 03/11/20.
//

import UIKit

class LaboratorioTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNameLaboratorio: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(lab: Result){
        self.labelNameLaboratorio.text = lab.term
    }

}
