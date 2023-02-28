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
           tb.register(SongTableViewCell.self, forCellReuseIdentifier: SongTableViewCell.identifier)
           return tb
       }()
    
        
    var tracks: [Track] = []
       
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tracks = Track.mockTracks

        
        view.backgroundColor = .white
        
        // set up the tableview
        
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }


}

extension ViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 150
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selecting row")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: SongTableViewCell.identifier, for: indexPath) as! SongTableViewCell
        
        return cell

    }
    
    
    
}


