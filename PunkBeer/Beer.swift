//
//  Beer.swift
//  PunkBeer
//
//  Created by Usuário Convidado on 27/11/17.
//  Copyright © 2017 br.com.Fiap.camila. All rights reserved.
//

import Foundation
import UIKit

class Beer {
    
    var name: String?
    var description: String
    var imageURL: String?
    var tagline: String?
    var abv: Double?
    var ibu: Double?
   
    
    
    init( name: String, description: String,imageURL: String, tagline: String, abv: Double, ibu: Double ) {
        
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.tagline = tagline
        self.abv = abv
        self.ibu = ibu
       
    }
}
