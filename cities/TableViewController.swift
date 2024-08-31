//
//  TableViewController.swift
//  cities
//
//  Created by iskapc on 27.08.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var cities = [
        City(name: "Almaty", population: 1854656, imageName: "almaty", yearOfFormationOrSinceTime: "1867"),
        City(name: "Astana", population: 1078384, imageName: "astana", yearOfFormationOrSinceTime: "1831"),
        City(name: "Aktau", population: 183006, imageName: "aktau", yearOfFormationOrSinceTime: "1963"),
        City(name: "Shymkent", population: 1011511, imageName: "shymkent", yearOfFormationOrSinceTime: "средних веков"),
        City(name: "Karaganda", population: 497767, imageName: "karaganda", yearOfFormationOrSinceTime: "1934")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    @IBAction func addCity(_ sender: Any) {
        cities.append(City())
        tableView.reloadData()
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)

        let labelCityName = cell.viewWithTag(1001) as! UILabel
        labelCityName.text = "\(cities[indexPath.row].name)"
        
        let labelPopulation = cell.viewWithTag(1002) as! UILabel
        labelPopulation.text = "Популяция: \(cities[indexPath.row].population)"
        
        let imageViewCity = cell.viewWithTag(1003) as! UIImageView
        imageViewCity.image = UIImage(named: cities[indexPath.row].imageName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
//        detailVC.cityName = cities[indexPath.row].name
//        detailVC.imageCityName = cities[indexPath.row].imageName
//        detailVC.population = cities[indexPath.row].population
        
        detailVC.city = cities[indexPath.row]
        
        navigationController?.show(detailVC, sender: self)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
