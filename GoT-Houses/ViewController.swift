//
//  ViewController.swift
//  GoT-Houses
//
//  Created by Romain Francois on 22/07/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //    var houses = ["Dartford", "Bellegarde", "Nimes"]
    var houses = Houses()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //  Fake data to make sure tableView is working properly
        //  houses.houseArray.append(HouseInfo(name: "Dartford", region: "", coatOfArms: "", words: ""))
        //  houses.houseArray.append(HouseInfo(name: "Bellegarde", region: "", coatOfArms: "", words: ""))
        
        houses.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        houses.houseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Minimum to populate the tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). " + houses.houseArray[indexPath.row].name
        
        return cell
    }
    
    
}
