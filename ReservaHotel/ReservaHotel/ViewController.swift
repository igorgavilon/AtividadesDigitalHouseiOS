//
//  ViewController.swift
//  ReservaHotel
//
//  Created by Igor Gavilon on 09/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkinPicker: UIDatePicker!
        
    @IBOutlet weak var checkoutPicker: UIDatePicker!
    
    @IBOutlet weak var switchReward: UISwitch!
    
    @IBOutlet weak var labelResult: UILabel!
    
    var arrayHotels = [Hotel]()
    
    var client = Client(type: .regular)
        
    var checkinDate = Date()
    var checkoutDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelResult.text = ""
        arrayHotels.append(Hotel(name: "Parque das Flores", classification: 3, weekRegular: 110.0, weekReward: 80.0, weekendRegular: 90, weekendReward: 80.0))
        arrayHotels.append(Hotel(name: "Jardim Botânico", classification: 4, weekRegular: 160.0, weekReward: 110.0, weekendRegular: 60.0, weekendReward: 50.0))
        arrayHotels.append(Hotel(name: "Mar Atlântico", classification: 5, weekRegular: 220.0, weekReward: 100.0, weekendRegular: 150.0, weekendReward: 40.0))
        
    }
    
    
    @IBAction func bestHotelClick(_ sender: Any) {
        //calcula número de dias hospedado
        self.checkinDate = self.checkinPicker.date
        self.checkoutDate = self.checkoutPicker.date
        
        arrayHotels[0].calculateTotal(checkinDate: checkinDate, checkoutDate: checkoutDate, clientType: client.type)
        arrayHotels[1].calculateTotal(checkinDate: checkinDate, checkoutDate: checkoutDate, clientType: client.type)
        arrayHotels[2].calculateTotal(checkinDate: checkinDate, checkoutDate: checkoutDate, clientType: client.type)
        
        
        //encontra o menor valor total
        let cheaper = arrayHotels.min { $0.valorTotal < $1.valorTotal }
        var text = cheaper!.name
        //procura por outros valores menores que sejam iguais
        //verifica se a classificação dos outros hotéis é maior
        for item in arrayHotels{
            if(item.valorTotal == cheaper?.valorTotal){
                if(item.classification > cheaper!.classification){
                    text = item.name
                }
            }
        }
        //a label de sresultado recebe o hotel com menor valor
        //e maior classificação
        labelResult.text = text
        
    }
    
    @IBAction func checkinPickerChanged(_ sender: UIDatePicker) {
        
        checkinDate = sender.date
    }
    
    
    @IBAction func checkoutPickerChanged(_ sender: UIDatePicker) {
       
        checkoutDate = sender.date
    }
    
    
    @IBAction func switchRewardChanged(_ sender: Any) {
        if(switchReward.isOn){
            self.client.type = .reward
        }else{
            self.client.type = .regular
        }
    }
    
}

