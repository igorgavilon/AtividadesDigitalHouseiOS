//
//  ViewController.swift
//  Exercicio02
//
//  Created by Igor Gavilon on 07/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animalsTableView: UITableView!
    var arrayAnimais = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animalsTableView.delegate = self
        animalsTableView.dataSource = self
        
        arrayAnimais.append(Animal(nome: "xuxu", raca: "shihtzu", peso: 2.5, especie: "cachorro"))
        arrayAnimais.append(Animal(nome: "bilú", raca: "shihtzu", peso: 4.0, especie: "cachorro"))
        arrayAnimais.append(Animal(nome: "dark", raca: "siamês", peso: 2.5, especie: "gato"))
        arrayAnimais.append(Animal(nome: "josé", raca: "papagaio", peso: 2.5, especie: "ave"))
        arrayAnimais.append(Animal(nome: "thor", raca: "shihtzu", peso: 4.5, especie: "cachorro"))
        arrayAnimais.append(Animal(nome: "gold", raca: "beta", peso: 0.1, especie: "peixe"))
        arrayAnimais.append(Animal(nome: "dengo", raca: "vira lata", peso: 5, especie: "cachorro"))
        arrayAnimais.append(Animal(nome: "garfield", raca: "orangecat", peso: 2.5, especie: "gato"))
        arrayAnimais.append(Animal(nome: "bolota", raca: "albino", peso: 10, especie: "suíno"))
        arrayAnimais.append(Animal(nome: "pink", raca: "camundongo", peso: 0.5, especie: "rato"))



    }


}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let screenmodal = UIStoryboard(name: "modal", bundle: nil).instantiateInitialViewController() as? ModalViewController {
                
                present(screenmodal, animated: true, completion: nil)
                screenmodal.setupLabelName(name: arrayAnimais[indexPath.row].nome)
            }
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAnimais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = animalsTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! AnimalTableViewCell
        
        cell.setup(animal: arrayAnimais[indexPath.row])
        return cell
    }
    
    
}
