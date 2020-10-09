//
//  ViewController.swift
//  Exercicio01
//
//  Created by Igor Gavilon on 06/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewPessoa: UITableView!
    
    var arrayPessoas = [Pessoa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewPessoa.delegate = self
        tableViewPessoa.dataSource = self
        
        arrayPessoas.append(Pessoa(nome: "Igor", cargo: "Engenheiro", email: "igor@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Gavilon", cargo: "Médico", email: "gavilon@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Ana", cargo: "Contadora", email: "ana@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Jonas", cargo: "Vendedora", email: "jonas@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Maycon", cargo: "Gerente", email: "maycon@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Tatiane", cargo: "Vendedora", email: "tati@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Eder", cargo: "Relações Publicas", email: "eder@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Ader", cargo: "Médico", email: "ader@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Rose", cargo: "Nutricionista", email: "rose@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Jaqueline", cargo: "Gerente", email: "jaque@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Tereza", cargo: "Suporte", email: "tereza@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Carlos", cargo: "Mecânico", email: "carlos@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Paulo", cargo: "Vendedor", email: "paulo@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Danielle", cargo: "Engenheira", email: "dani@gmail.com"))
        arrayPessoas.append(Pessoa(nome: "Roberto", cargo: "Serviços Gerais", email: "roberto@gmail.com"))

    }


}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let screenmodal = UIStoryboard(name: "modal", bundle: nil).instantiateInitialViewController() as? modalViewController {
                
                present(screenmodal, animated: true, completion: nil)
                screenmodal.setLabelName(nome: arrayPessoas[indexPath.row].nome)
            }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPessoas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PessoaTableViewCell", for: indexPath) as! PessoaTableViewCell
        
        cell.setup(pessoa: arrayPessoas[indexPath.row])
        return cell
    }
}


