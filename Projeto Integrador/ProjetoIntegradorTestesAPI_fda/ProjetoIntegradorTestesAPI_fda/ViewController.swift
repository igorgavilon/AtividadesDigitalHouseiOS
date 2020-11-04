//
//  ViewController.swift
//  ProjetoIntegradorTestesAPI_fda
//
//  Created by Igor Gavilon on 01/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewLocalidade: UIView!
    @IBOutlet weak var viewBotoes: UIView!
    
    @IBOutlet weak var buttonPesquisar: UIButton!
    @IBOutlet weak var buttonCategoria: UIButton!
    @IBOutlet weak var buttonLista: UIButton!
    @IBOutlet weak var buttonSettings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewLocalidade.layer.cornerRadius = 40.0
        self.viewBotoes.layer.cornerRadius = 40.0
        self.buttonPesquisar.layer.cornerRadius = 20.0
        self.buttonCategoria.layer.cornerRadius = 20.0
        self.buttonLista.layer.cornerRadius = 20.0
        self.buttonSettings.layer.cornerRadius = 20.0
    }

    @IBAction func pesquisarAction(_ sender: Any) {
        if let myViewPesquisar = UIStoryboard(name: "Pesquisar", bundle: nil).instantiateInitialViewController() as? PesquisarViewController{
            
            //Navigation
            navigationController?.pushViewController(myViewPesquisar, animated: true)
        }
    }
    
    @IBAction func categoriasAction(_ sender: Any) {
        if let myViewCategorias = UIStoryboard(name: "Categorias", bundle: nil).instantiateInitialViewController() as? CategoriasViewController{
            
            //Navigation
            navigationController?.pushViewController(myViewCategorias, animated: true)
        }
    }
    @IBAction func minhaListaAction(_ sender: Any) {
    }
    @IBAction func settingsAction(_ sender: Any) {
    }
}

