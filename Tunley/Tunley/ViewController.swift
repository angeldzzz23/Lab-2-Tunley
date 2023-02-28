//
//  ViewController.swift
//  Tunley
//
//  Created by Angel Zambrano on 2/28/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK:  properties
    let tableview: UITableView = {
           let tb = UITableView()
           tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tb.backgroundColor = .red
//           tb.register(RestaurantTableViewCell.self, forCellReuseIdentifier: RestaurantTableViewCell.identifier)
           return tb
       }()
       
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        // set up the tableview
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }


}



