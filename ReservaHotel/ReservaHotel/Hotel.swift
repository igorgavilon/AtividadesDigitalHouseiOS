//
//  Hotel.swift
//  ReservaHotel
//
//  Created by Igor Gavilon on 09/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import Foundation

class Hotel{
    var name: String
    var classification: Int
    var weekRegular: Float
    var weekReward: Float
    var weekendRegular: Float
    var weekendReward: Float
    var valorTotal: Float = 0.0
   
    
    init(name: String, classification: Int, weekRegular:Float, weekReward: Float, weekendRegular: Float, weekendReward: Float) {
        self.name = name
        self.classification = classification
        self.weekRegular = weekRegular
        self.weekReward = weekReward
        self.weekendRegular = weekendRegular
        self.weekendReward = weekendReward
    }
    
    public func calculateTotal(checkinDate: Date, checkoutDate: Date, clientType: type){
        valorTotal = 0.0
        let calendar = Calendar.current
        let daysDifference = calendar.dateComponents([.day], from: checkinDate, to:checkoutDate)
        print(daysDifference.day!)
        
        for index in 0...daysDifference.day! {
            let day = calendar.date(byAdding: .day, value: index, to: checkinDate)!
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.dateFormat = "EEE"
            let strDate = dateFormatter.string(from: day)
            if(strDate == "Sat" || strDate == "Sun"){
                if(clientType == .reward){
                    valorTotal += weekendReward
                }else{
                    valorTotal += weekendRegular
                }
            }else{
                if(clientType == .reward){
                    valorTotal += weekReward
                }else{
                    valorTotal += weekRegular
                }
            }
            
        }
        print("Hotel: \(self.name) ; total: \(self.valorTotal) ; clienteType: \(clientType)")
        
    }
    
}
