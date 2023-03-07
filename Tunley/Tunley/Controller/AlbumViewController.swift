//
//  AlbumViewController.swift
//  Tunley
//
//  Created by Angel Zambrano on 3/7/23.
//

import UIKit


//func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 10
//}
//
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCellReuseIdentifier", for: indexPath) as! UICollectionViewCell
//    cell.backgroundColor = .yellow
//
//    return cell
//}

class AlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  
    
    private var peopleCollectionView: UICollectionView! // the collection that displays people
    private let peopleCellReuseIdentifier = "peopleCellReuseIdentifier"
    private let pCellPadding:CGFloat = 3

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let peopleLayout = UICollectionViewFlowLayout()
        peopleLayout.scrollDirection = .vertical
        peopleLayout.minimumInteritemSpacing = pCellPadding
        peopleLayout.minimumLineSpacing = pCellPadding
        peopleLayout.sectionInset = UIEdgeInsets(top: pCellPadding, left: 0, bottom: pCellPadding, right: 0)
        
        
        peopleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: peopleLayout)
        peopleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        peopleCollectionView.backgroundColor = .red
        view.addSubview(peopleCollectionView)
        
        peopleCollectionView.dataSource = self
        peopleCollectionView.delegate = self
        
        
        peopleCollectionView.register(SongsCollectionviewcell.self, forCellWithReuseIdentifier: SongsCollectionviewcell.identifier)
        
        NSLayoutConstraint.activate([
            peopleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            peopleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            peopleCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            peopleCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
    }
    
    
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongsCollectionviewcell.identifier, for: indexPath) as! SongsCollectionviewcell
        
       
           return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = ((collectionView.frame.width) - (pCellPadding) ) / 3
        
        return CGSize(width:size - 3, height: size - 3 )
    }
    
    
    
    

}
