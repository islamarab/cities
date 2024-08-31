//
//  ViewController.swift
//  cities
//
//  Created by iskapc on 27.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var imageViewCity: UIImageView!
    @IBOutlet weak var labelPopulation: UILabel!
    @IBOutlet weak var labelYearOfFormation: UILabel!
    
    var city = City()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelCityName.text = city.name
        imageViewCity.image = UIImage(named: city.imageName)
        labelPopulation.text = "Популяция: \(city.population)"
        labelYearOfFormation.text = "Город с \(city.yearOfFormationOrSinceTime)"
    }
}

