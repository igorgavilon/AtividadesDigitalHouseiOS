//
//  PesquisarViewController.swift
//  ProjetoIntegradorTestesAPI_fda
//
//  Created by Igor Gavilon on 01/11/20.
//

import UIKit

class PesquisarViewController: UIViewController {

    @IBOutlet weak var viewMenu: UIView!
    @IBOutlet weak var viewTextFields: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewMenu.layer.cornerRadius = 40.0
        self.viewTextFields.layer.cornerRadius = 40.0
        
    }
    
    @IBAction func pesquisarAction(_ sender: Any) {
        if let myViewResultadosBusca = UIStoryboard(name: "ResultadosBusca", bundle: nil).instantiateInitialViewController() as? ResultadosBuscaViewController{
            
            //Navigation
            navigationController?.pushViewController(myViewResultadosBusca, animated: true)
        }
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
