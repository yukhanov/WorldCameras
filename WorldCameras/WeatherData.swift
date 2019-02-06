//
//  WeatherData.swift
//  WorldCameras
//
//  Created by Юханов Сергей Сергеевич on 06/02/2019.
//  Copyright © 2019 Юханов Сергей Сергеевич. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherData {
    var temp: String = ""
    var name: String = ""
    
    
    init(json: JSON, city: String) {
        self.temp = json["main"]["temp"].stringValue
        self.name = json["name"].stringValue
    }
    
    
}
