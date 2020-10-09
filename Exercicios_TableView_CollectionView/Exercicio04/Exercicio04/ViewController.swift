//
//  ViewController.swift
//  Exercicio04
//
//  Created by Igor Gavilon on 08/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var array = [
        "igor",
        "gavilon",
        "carlos",
        "paulo",
        "ana",
        "roberto",
        "tereza",
        "danielle",
        "júnior",
        "eder",
        "lorena",
        "rita maria",
        "doralice",
        "tonico",
        "daniel",
        "caroline",
        "aldo",
        "denise",
        "fagner",
        "edvaldo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }


}
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        array.remove(at: indexPath.row)
        collectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! NamesCollectionViewCell
        cell.setLabelName(name: array[indexPath.row])
        
        return cell
    }
    
    
    
}
