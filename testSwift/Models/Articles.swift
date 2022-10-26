//
//  Articles.swift
//  testSwift
//
//  Created by Marcio on 25/10/22.
//

import Foundation

struct ArticleList: Decodable {
    
    let articles: [Article]
    
}
struct Article: Decodable {
    
    let title: String
    let description: String
    
}




struct ItemList: Decodable {
    
    let items: [Item]
    
}
struct Item: Decodable {
    
    let id: Int
    let node_id: String
    
}
