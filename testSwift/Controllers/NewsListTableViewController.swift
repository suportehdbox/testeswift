//
//  NewsListTableViewController.swift
//  testSwift
//
//  Created by Marcio on 25/10/22.
//

import Foundation
import UIKit


// MARK: Criar Webservice
// MARK: Criar Models
// MARK: Criar View Models

// MARK: Configurar Cell tableView
// MARK: Criar Cell tableView
            // Ligar a classe na TableVieCell
            // Ligar as OUTLETS
    




// MARK: classe para testes
/*
class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    private func setup(){
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
      
        
        //let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-09-26&sortBy=publishedAt&apiKey=6d7959da978b449e84efab3ee0ead727")!
      
        
    
        let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1")!
    
        Webservice().getArticles(url: url) { _ in
            
        }
        
        
        
        
        
    }
}
*/


class NewsListTableViewController: UITableViewController {
    
    // 1
    private var articleListVM: ArticleListViewModel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    
    private func setup(){
        
        
        // MARK: https://github.com/soluevo/ChallengeiOS/blob/master/README.md
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
      
        //let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1")!
        let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars")!
        
        // 1
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    
                }
            }
            
        }
        
    }
    
    
    // 2
    // numberOfSections
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    // 3 number de baixo
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    // 4
    // cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleArIndex(indexPath.row)
        
        cell.nameLabel.text = String(articleVM.name)
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: articleVM.avatar_url)!) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                cell.url_avatarImage.image = image
                            }
                        }
                    }
                }
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleVM = self.articleListVM.articleArIndex(indexPath.row)
        
        print(articleVM.id)
        print(articleVM.node_id)
        print(articleVM.avatar_url)
        
    }
    
}




