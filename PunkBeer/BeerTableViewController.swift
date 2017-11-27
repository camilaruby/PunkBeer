//
//  BeerTableViewController.swift
//  PunkBeer
//
//  Created by Usuário Convidado on 22/11/17.
//  Copyright © 2017 br.com.Fiap.camila. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewController: UITableViewController {
    
    @IBOutlet  weak var beerTableView: UITableView!
    
    lazy var ListBeer = [Beer]()
    var beerSelected: Beer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        loadBeers()
    }
    
    func loadBeers(){
        
        REST.getBeers { beerListResult in
            guard let beers = beerListResult else { return }
            DispatchQueue.main.async {
                self.ListBeer = beers
                self.tableView.reloadData()
                
            }
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return ListBeer.count
  
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell") as! BeerCell
        
        // Configure the cell...
        
        let url = ImageResource(downloadURL: URL(string: ListBeer[indexPath.row].imageURL!)!, cacheKey: ListBeer[indexPath.row].name)
        let abv = String(format: "%.1f", ListBeer[indexPath.row].abv ?? 0.0)
        
        cell.ImgvWBeer.kf.setImage(with: url)
        cell.lblnome.text = ListBeer[indexPath.row].name
        cell.teor.text = "Teor alcoólico: \(abv)"

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        beerSelected = ListBeer[indexPath.row]
        performSegue(withIdentifier: "Beer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Beer" {
           let beers = segue.destination as! BeerViewController
           beers.beer = self.beerSelected
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
