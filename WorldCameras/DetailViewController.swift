//
//  DetailViewController.swift
//  WorldCameras
//
//  Created by Юханов Сергей Сергеевич on 23/01/2019.
//  Copyright © 2019 Юханов Сергей Сергеевич. All rights reserved.
//

import UIKit
import AVFoundation
//let weatherData = WeatherService()

class DetailViewController: UITableViewController {

    @IBOutlet weak var videoViewCell: UITableViewCell!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var currentCity: String = ""
    var heightList: [CGFloat] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightList = [tableView.frame.height * 0.25, 50, 50, 50, 50]
        
        
        WeatherService.getWeatherData(city: currentCity)
        
        NotificationCenter.default.addObserver(self, selector: #selector(send_object2), name: NSNotification.Name(rawValue: "send"), object: nil)

    }
    
    @objc func send_object2(_ status: Notification) {
        //        print(progress.progress)
        //let list: WeatherData = status.object as! WeatherData
        DispatchQueue.main.async {
            
            self.weatherLabel.text = String(WeatherService.getWeatherFromName(city: self.currentCity)!.temp)
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationItem.title = currentCity
        let videoURL = URL(string: "https://media-01.obit.ru/peterhof/index.m3u8")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoViewCell.bounds
        self.videoViewCell.layer.addSublayer(playerLayer)
        player.play()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMapVC" {
            let mapVC: MapViewController = segue.destination as! MapViewController
//            if let indexPath = tableView.indexPath(for: cell) {
                mapVC.city = currentCity
//            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightList[indexPath.row]
    }
  


    

}

