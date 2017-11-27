//
//  REST.swift
//  PunkBeer
//
//  Created by Usuário Convidado on 27/11/17.
//  Copyright © 2017 br.com.Fiap.camila. All rights reserved.
//

import Foundation

class REST{
    private static let URL_ = "https://api.punkapi.com/v2/beers"
    
    static func getBeers(onComplete: @escaping (_ success: [Beer]?)->()){
        guard let url = URL(string: URL_) else {
            onComplete(nil)
            return
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print("Err Data Task. Details: ", error!.localizedDescription)
                onComplete(nil)
            }
            else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        var beers: [Beer] = []
                        
                        for item in json {
                            
                            let name = item["name"] as? String
                            let description = item["description"] as? String ?? ""
                            let tagline = item["tagline"] as? String ?? ""
                            let imageURL = item["image_url"] as? String
                            let abv = item["abv"] as? Double ?? 0.0
                            let ibu = item["ibu"] as? Double ?? 0.0
                            
                            
                            if (imageURL != nil && name != nil) {
                                let beer = Beer(name: name!, description: description, imageURL: imageURL!, tagline: tagline, abv: abv, ibu: ibu)
                                
                                beers.append(beer)
                            }
                        }
                        onComplete(beers)
                    }
                    catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                }
                else {
                    print("Err request. Details: ", response.statusCode)
                    onComplete(nil)
                }
            }
            
        }
        task.resume()
    }
}
