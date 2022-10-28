//
//  NewsListTableViewController.swift
//  testSwift
//
//  Created by Marcio on 25/10/22.
//

import Foundation
import UIKit

class TestListTableViewController: UITableViewController {

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
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleArIndex(indexPath.row)
        
        cell.nameLabel.text = String(articleVM.name)
        cell.forks_count.text = String(articleVM.forks_count)
        cell.full_nameLabel.text = articleVM.full_name
        cell.stargazers_count.text = String(articleVM.stargazers_count)
        
        
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
        
        Variable.name = articleVM.name
        Variable.forks_count = String(articleVM.forks_count)
        Variable.full_name = articleVM.full_name
        Variable.stargazers_count = String(articleVM.stargazers_count)
        Variable.url = articleVM.avatar_url
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.present(newViewController, animated: true, completion: nil)

        
        
        
    }
    
}




