//
//  BeerCell.swift
//  PunkBeer
//
//  Created by Usuário Convidado on 22/11/17.
//  Copyright © 2017 br.com.Fiap.camila. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell {

    @IBOutlet weak var ImgvWBeer: UIImageView!
    @IBOutlet weak var lblnome: UILabel!
    @IBOutlet weak var teor: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
