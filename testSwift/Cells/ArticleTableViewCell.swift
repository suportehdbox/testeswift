//
//  ArticleTableViewCell.swift
//  testSwift
//
//  Created by Marcio on 26/10/22.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var node_idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var full_nameLabel: UILabel!
    @IBOutlet weak var forks_url: UILabel!
    @IBOutlet weak var stargazers_count: UILabel!
    @IBOutlet weak var forks_count: UILabel!
    
    
    
    
    @IBOutlet weak var url_avatarImage: UIImageView!
    
    
}

