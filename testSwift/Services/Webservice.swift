//
//  Webservie.swift
//  testSwift
//
//  Created by Marcio on 25/10/22.
//

import Foundation

class Webservice {
    
    /*
    func getArticles(url: URL, completion: @escaping ([Any]?) -> () ) {
           
           URLSession.shared.dataTask(with: url) { data, response, error in
               
               if let error = error {
                   
                   print(error.localizedDescription)
                   completion(nil)
                   
               } else if let data = data {
                   
                   print(data)
                   
               }
               
           }.resume()
       }
     */
       
   
    func getArticles(url: URL, completion: @escaping ([Item]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
                
                let articlesList = try? JSONDecoder().decode(ItemList.self, from: data)
                
                if let articlesList = articlesList {
                    
                    completion(articlesList.items)
                    
                }
                
                print(articlesList?.items)
                print(data)
                
            }
            
        }.resume()
    }
    
}


