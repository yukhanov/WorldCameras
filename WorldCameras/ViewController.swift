//
//  ViewController.swift
//  WorldCameras
//
//  Created by Юханов Сергей Сергеевич on 22/01/2019.
//  Copyright © 2019 Юханов Сергей Сергеевич. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let cities = ["Moscow", "Paris", "London", "Oslo"]

    

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self


    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailVC", let cell = sender as? UITableViewCell {
            let detailVC: DetailViewController = segue.destination as! DetailViewController
                if let indexPath = tableView.indexPath(for: cell) {
                    detailVC.currentCity = cities[indexPath.row]
            }
        }
    }
    
 
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
}
