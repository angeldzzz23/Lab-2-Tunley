//
//  tabBarController.swift
//  Tunley
//
//  Created by Angel Zambrano on 3/7/23.
//

import UIKit



class tabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let home = UINavigationController(rootViewController: ViewController())
        let favorites = UINavigationController(rootViewController: AlbumViewController())
        
        home.title = "Home"
        favorites.title = "Favorites"
        
        home.tabBarItem.image = UIImage(systemName: "music.note.list")
        favorites.tabBarItem.image = UIImage(systemName: "guitars.fill")
        
        setViewControllers([home,favorites], animated: true)

    }
    

}
