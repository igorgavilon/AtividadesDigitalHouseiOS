//
//  modalViewController.swift
//  Exercicio01
//
//  Created by Igor Gavilon on 06/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class modalViewController: UIViewController {

    @IBOutlet weak var labelNameModal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setLabelName(nome: String){
        labelNameModal.text = nome
    }


}
