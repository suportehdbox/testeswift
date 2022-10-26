//
//  NewsListTableViewController.swift
//  testSwift
//
//  Created by Marcio on 25/10/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    

    private var articleListVM: ArticleListViewModel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    private func setup(){
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
      
        
        let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars")!
        
    
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    
                }
            }
            
        }
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleArIndex(indexPath.row)
        
        cell.idLabel.text = String(articleVM.id)
        cell.node_idLabel.text = articleVM.node_id
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleVM = self.articleListVM.articleArIndex(indexPath.row)
        
        print(articleVM.id)
        print(articleVM.node_id)
    }
    
}




