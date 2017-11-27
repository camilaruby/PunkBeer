//
//  BeerViewController.swift
//  PunkBeer
//
//  Created by Usuário Convidado on 27/11/17.
//  Copyright © 2017 br.com.Fiap.camila. All rights reserved.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTagLine: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var abv: UILabel!
    @IBOutlet weak var ibu: UILabel!
    @IBOutlet weak var ImgVwBeerx: UIImageView!
    
    var beer: Beer?
    var lastTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lastTitle = self.navigationController?.navigationBar.topItem?.title
        self.navigationController?.navigationBar.topItem?.title = ""

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getValuesBeers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = lastTitle
    }

    
    func getValuesBeers(){
        if beer != nil {
            
            
            let name = beer!.name
            let description = beer!.description
            let tagline = beer!.tagline
            let url = ImageResource(downloadURL: URL(string: (beer?.imageURL)!)!, cacheKey: beer?.name)
            //let abv = beer!.abv
            //let ibu = beer!.ibu
            
            lblName.text = name
            tvDescription.text = description
            lblTagLine.text = tagline
            ImgVwBeerx.kf.setImage(with: url)
            
            abv.text = String(format: "%.1f",beer!.abv!)
            ibu.text = String(format: "%.1f", beer!.ibu!)
            
            
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
