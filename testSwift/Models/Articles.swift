//
//  Articles.swift
//  testSwift
//
//  Created by Marcio on 25/10/22.
//

import Foundation

struct ItemList: Decodable {
    
    let items: [Item]
    
}
struct Item: Decodable {
    
    let id: Int
    let node_id: String
    let name: String
    let full_name: String
    let forks_url:String
    
    let stargazers_count: Int
    let forks_count: Int
    
    let owner: Owner
}


struct Owner: Decodable {
    
    let avatar_url: String
    
}

struct Variable {
    
    static var name = ""
    static var forks_count = ""
    static var full_name = ""
    static var stargazers_count = ""
    static var url = ""
}

