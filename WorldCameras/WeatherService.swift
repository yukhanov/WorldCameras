//
//  WeatherService.swift
//  WorldCameras
//
//  Created by Юханов Сергей Сергеевич on 05/02/2019.
//  Copyright © 2019 Юханов Сергей Сергеевич. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherService {
    
    
    func getWeatherData(city: String) {
        let weatherUrl = "https://api.openweathermap.org/data/2.5/weather"
        let params: Parameters = ["q": city, "appid": "02a082f1be3fb9bbf041f849ca8ad290", "units": "metric"]
        
        request(weatherUrl, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            if response.result.isSuccess {
                print(Thread.current)
                let weatherJSON: JSON = JSON(response.result.value!)
                print(weatherJSON)
                let temp: Int = weatherJSON["main"]["temp"].intValue
                //temp.dropLast(2)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "send"), object: temp)
                
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
        
        
    }

}
