//
//  DetailViewController.swift
//  GoT-Houses
//
//  Created by Romain Francois on 23/07/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatOfArmsTextView: UITextView!
    
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    
    var houseInfo: HouseInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Likely will never occur, but you can ...
        if houseInfo == nil {
            houseInfo = HouseInfo(name: "", region: "", coatOfArms: "", words: "")
        }
        
        updateUserInterface()
    }

    func updateUserInterface() {
        nameLabel.text = houseInfo.name
        wordsLabel.text = !houseInfo.words.isEmpty ? "\"\(houseInfo.words)\"" : ""
        regionLabel.text = houseInfo.region
        coatOfArmsTextView.text = houseInfo.coatOfArms
        regionImageView.image = UIImage(named: houseInfo.region)
        
        if houseInfo.coatOfArms.isEmpty {
            coatOfArmsLabel.isHidden = true
        }
    }
}
