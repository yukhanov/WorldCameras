//
//  FoursquareService.swift
//  WorldCameras
//
//  Created by Юханов Сергей Сергеевич on 14/02/2019.
//  Copyright © 2019 Юханов Сергей Сергеевич. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class FoursquareService {
    
    static func getVenuesFromLocation() {
        
       
        let foursquareUrl: String = "https://api.foursquare.com/v2/venues/search"
        let params: Parameters = ["client_id": "BWVHCDSDRPEFJUVILRT0WE2TSKVQVR1WY0CGXQFQBVCU2BYG", "client_secret": "RVQ0FVVQOB0D1KVTGE3OOQS3VNJ2G1CFS0ISYOOECLN1GDH5", "ll": "40.7243,-74.0018", "limit": "10", "v": "20190214"]
        
        request(foursquareUrl, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { (response) in
            if response.result.isSuccess {
                let foursquareJSON: JSON = JSON(response.result.value!)
                print(foursquareJSON)
                //                print(weatherJSON)
                //                let temp: Int = weatherJSON["main"]["temp"].intValue
                //print(weatherJSON)
                //let weatherData: WeatherData = WeatherData(json: foursquareJSON)
                
                //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "send"), object: weatherData.temp)
                
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
        
    }
    
    
}
