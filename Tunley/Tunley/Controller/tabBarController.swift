//
//  tabBarController.swift
//  Tunley
//
//  Created by Angel Zambrano on 3/7/23.
//

import UIKit

class sampleVC1:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

class sampleVC2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

class sampleVC3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

class sampleVC4: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}



class tabBarController: UITabBarController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let home = UINavigationController(rootViewController: ViewController())
        let favorites = UINavigationController(rootViewController: sampleVC2())
        
        home.title = "Home"
        favorites.title = "Favorites"
        
        home.tabBarItem.image = UIImage(systemName: "music.note.list")
        favorites.tabBarItem.image = UIImage(systemName: "guitars.fill")
        
        // UIImage(systemName:
        
        
        setViewControllers([home,favorites], animated: true)

        // Do any additional setup after loading the view.
    }
    

}
