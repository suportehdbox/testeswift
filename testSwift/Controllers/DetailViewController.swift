//
//  DetailViewController.swift
//  testSwift
//
//  Created by Marcio on 28/10/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var full_nameLabel: UILabel!
    @IBOutlet weak var stargazers_count: UILabel!
    @IBOutlet weak var forks_count: UILabel!
    @IBOutlet weak var url_avatarImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initControls()
    }
    
    private func initControls(){
        
        let url = URL(string: Variable.url)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.url_avatarImage.image = UIImage(data: data!)
            }
        }
        full_nameLabel.text = Variable.name
        forks_count.text = Variable.forks_count
        full_nameLabel.text  = Variable.full_name
        stargazers_count.text = Variable.stargazers_count
        
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
