//
//  Client.swift
//  ReservaHotel
//
//  Created by Igor Gavilon on 09/10/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import Foundation

enum type{
    case reward
    case regular
}

class Client{
    var type: type
    
    init(type: type) {
        self.type = type
    }
}
