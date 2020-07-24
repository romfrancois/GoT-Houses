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
    var pageNumber = 1
    
    var continueLoading = true
    
    func getData(completed: @escaping () -> ()) {
        // Create a URL
        let urlString = "https://www.anapioficeandfire.com/api/houses?page=\(pageNumber)&pageSize=50"
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
                
                if results.count > 0 {
                    self.pageNumber = self.pageNumber + 1
                    self.houseArray = self.houseArray + results
                } else {
                    self.continueLoading = false
                }
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
    
}
