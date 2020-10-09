//
//  ModalViewController.swift
//  Exercicio02
//
//  Created by Igor Gavilon on 08/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupLabelName(name: String){
        self.labelName.text = name
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
