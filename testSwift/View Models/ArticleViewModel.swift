//
//  ArticleViewModel.swift
//  testSwift
//
//  Created by Marcio on 26/10/22.
//

import Foundation



// MARK: CONFIG DADOS PARA TABLEVEW
struct ArticleListViewModel {
    
    let articles: [Item]
    
}


extension ArticleListViewModel {
    
    var numberOfSections: Int {
        
        return 1
        
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        
        return self.articles.count
        
    }
    
    
    func articleArIndex(_ index: Int) -> ArticleViewModel {
        
        let article = self.articles[index]
        return ArticleViewModel(article)
        
    }
}

// MARK: CONFIG DADOS


struct ArticleViewModel {
    
    private let article: Item
    
}


extension ArticleViewModel {
    
    init(_ article: Item) {
        
        self.article = article
        
    }
    
}



extension ArticleViewModel {
    
    var id: Int {
        
        return self.article.id
        
    }
    
}


extension ArticleViewModel {
    
    var node_id: String {
        
        return self.article.node_id
        
    }
    
}




extension ArticleViewModel {
    
    var name: String {
        
        return self.article.name
        
    }
    
}



extension ArticleViewModel {
    
    var full_name: String {
        
        return self.article.full_name
        
    }
    
}




extension ArticleViewModel {
    
    var stargazers_count: Int {
        
        return self.article.stargazers_count
        
    }
    
}





extension ArticleViewModel {
    
    var forks_count: Int {
        
        return self.article.forks_count
        
    }
    
}









extension ArticleViewModel {
    
    var avatar_url: String {
        
        return self.article.owner.avatar_url
        
    }
    
}

