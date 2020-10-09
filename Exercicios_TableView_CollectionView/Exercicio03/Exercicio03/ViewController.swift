//
//  ViewController.swift
//  Exercicio03
//
//  Created by Igor Gavilon on 07/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayCars = [Car]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrayCars.append(Car(nome: "Range Rover", image: "car.jpg"))
        arrayCars.append(Car(nome: "Fiat Strada", image: "car.jpg"))
        arrayCars.append(Car(nome: "Ford Ranger", image: "car.jpg"))
        arrayCars.append(Car(nome: "Chevrolet Astra", image: "car.jpg"))
        arrayCars.append(Car(nome: "Nissan Tiida", image: "car.jpg"))
        arrayCars.append(Car(nome: "Ford Fiesta", image: "car.jpg"))
        arrayCars.append(Car(nome: "Fiat Toro", image: "car.jpg"))
        arrayCars.append(Car(nome: "Land Rover", image: "car.jpg"))
        arrayCars.append(Car(nome: "Chevrolet Corsa", image: "car.jpg"))
        arrayCars.append(Car(nome: "Toyota Corola", image: "car.jpg"))

    }


}
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let myViewPushed = UIStoryboard(name: "pushed", bundle: nil).instantiateInitialViewController() as? PushedViewController{
            
            
            //Navigation
            navigationController?.pushViewController(myViewPushed, animated: true)
            myViewPushed.setImageView(image: arrayCars[indexPath.row].image)
            myViewPushed.title = arrayCars[indexPath.row].nome
        }
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionViewCell", for: indexPath) as! CarCollectionViewCell
        cell.setup(car: arrayCars[indexPath.row])
        
        return cell
    }
    
    
}
