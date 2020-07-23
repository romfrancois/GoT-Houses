//
//  Houses.swift
//  GoT-Houses
//
//  Created by Romain Francois on 23/07/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import Foundation

class Houses {
    var houseArray: [HouseInfo] = []
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber = 1
    
    func getData(completed: @escaping () -> ()) {
        // Create a URL
        let urlString = url
        guard let url = URL(string: urlString) else {
            print("ERROR: Couldn't create a URL from \(urlString)")
            completed()
            return
        }
        
        // Create session
        let session = URLSession.shared
        
        // get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            // deal with the data
            do {
                // Basics to get and print data from a json file
//                let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                print("json: \(json)")
                
                let results = try JSONDecoder().decode([HouseInfo].self, from: data!)
//                print("results: \(results)")
                self.houseArray = results
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
    
}
