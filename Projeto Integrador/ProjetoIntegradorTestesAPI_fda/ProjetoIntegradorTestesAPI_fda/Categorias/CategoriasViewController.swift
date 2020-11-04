//
//  CategoriasViewController.swift
//  ProjetoIntegradorTestesAPI_fda
//
//  Created by Igor Gavilon on 01/11/20.
//

import UIKit

class CategoriasViewController: UIViewController {

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var buttonLaboratorio: UIButton!
    @IBOutlet weak var buttonGenericos: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewMenu.layer.cornerRadius = 40.0
        self.buttonLaboratorio.layer.cornerRadius = 20.0
        self.buttonGenericos.layer.cornerRadius = 20.0
    }
    
    @IBAction func laboratorioAction(_ sender: Any) {
        if let myViewLaboratorio = UIStoryboard(name: "Laboratorio", bundle: nil).instantiateInitialViewController() as? LaboratorioViewController{
            
            //Navigation
            navigationController?.pushViewController(myViewLaboratorio, animated: true)
        }
    }
    
    @IBAction func genericosAction(_ sender: Any) {
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
