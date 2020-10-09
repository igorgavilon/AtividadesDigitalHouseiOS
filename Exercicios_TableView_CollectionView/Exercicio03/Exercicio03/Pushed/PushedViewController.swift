//
//  PushedViewController.swift
//  Exercicio03
//
//  Created by Igor Gavilon on 08/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class PushedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageHere: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageView.image = imageHere
    }
    
    func setImageView(image: String){
        self.imageHere = UIImage(named: image)
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
