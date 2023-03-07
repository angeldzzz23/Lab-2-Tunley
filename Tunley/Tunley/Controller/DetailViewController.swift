//
//  DetailViewController.swift
//  Tunley
//
//  Created by Angel Zambrano on 2/28/23.
//

import UIKit

class DetailViewController: UIViewController {

    var track: Track!
    
    var verticalSV: UIStackView = {
        let vs = UIStackView()
        vs.axis = .vertical
        vs.spacing = 15
        vs.translatesAutoresizingMaskIntoConstraints = false
        return vs
    }()
    
    
    var fView: UIView = {
       let fView = UIView()
       fView.translatesAutoresizingMaskIntoConstraints = false

       return fView
    }()
    
    var songImgview: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var trackName: UILabel = {
        var lbl = UILabel()
        lbl.text = "Ice Cream"
        lbl.font = UIFont.systemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var artistTitleLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "Artist"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
        
    }()
    
    // this contains the actual name of the artist.
    var artistLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "BLACKPINK & Selena Gomez"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
        
    }()
    
    // album
    
    var albumTitleLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "Album"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
        
    }()
    
    // this contains the actual name of the artist.
    var albumLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "The Album"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)

        return lbl
        
    }()
    
    
    // genre
    var genreTitleLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "Genre"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
        
    }()
    
    
    var genreLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "K-Pop"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)

        return lbl
        
    }()
    
    // release date
    var releaseDateTitleLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "Release Date"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
        
    }()
    
    
    var releaseDateLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "Dec 5, 2022"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
        
    }()
    
    // duration
    
    var durationTitleLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "Duration"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        return lbl
        
    }()
    
    var duratonLbl: UILabel = {
        var lbl  = UILabel()
        lbl.text = "2:37"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18)

        return lbl
        
    }()
    
    
    
    init(track: Track) {
           super.init(nibName: nil, bundle: nil)
           self.track = track
        
        
       }
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            setUp()
        
    
        SettingExtractedData()
        
        
        
        Task {
//            NetworkManager.fetchImage(from: self.track.artworkUrl100)
            do {
                var url = URL(string: self.track.artworkUrl100)
                let image = try await NetworkManager.fetchImage(from: url!)
                DispatchQueue.main.async {
                    self.songImgview.image = image
                }
                
            } catch {
                print(error)
            }

        }
    
        
    }
    
    fileprivate func SettingExtractedData() {
        //            // Set labels with the associated track values.
        trackName.text = track.trackName
        artistLbl.text = track.artistName
        albumLbl.text = track.collectionName
        
        genreLbl.text = track.primaryGenreName
        //
        //            // Create a date formatter to style our date and convert it to a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        releaseDateLbl.text = dateFormatter.string(from: track.releaseDate)
        //
        //            // Use helper method to convert milliseconds into `mm:ss` string format
        duratonLbl.text = String(formattedTrackDuration(with: track.trackTimeMillis))
    }
    

    
    
    
    fileprivate func setUp() {
        view.addSubview(verticalSV)
        NSLayoutConstraint.activate([
            verticalSV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            verticalSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        verticalSV.addArrangedSubview(fView)
        
        NSLayoutConstraint.activate([
            fView.widthAnchor.constraint(equalToConstant: view.frame.width-15),
            fView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        fView.addSubview(self.songImgview)

        NSLayoutConstraint.activate([
            songImgview.centerYAnchor.constraint(equalTo: fView.centerYAnchor),
            songImgview.leadingAnchor.constraint(equalTo: fView.leadingAnchor),
            songImgview.widthAnchor.constraint(equalToConstant: 100),
            songImgview.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        verticalSV.addArrangedSubview(artistTitleLbl)
        
        fView.addSubview(trackName)
        
        NSLayoutConstraint.activate([
            trackName.centerYAnchor.constraint(equalTo: fView.centerYAnchor),
            trackName.leadingAnchor.constraint(equalTo: songImgview.trailingAnchor, constant: 25),
        ])
    
        
        verticalSV.addArrangedSubview(artistLbl)
        verticalSV.addArrangedSubview(albumTitleLbl)
        verticalSV.addArrangedSubview(albumLbl)
        verticalSV.addArrangedSubview(self.genreTitleLbl)
        verticalSV.addArrangedSubview(self.genreLbl)
        verticalSV.addArrangedSubview(self.releaseDateTitleLbl)
        verticalSV.addArrangedSubview(self.releaseDateLbl)
        verticalSV.addArrangedSubview(self.durationTitleLbl)
        verticalSV.addArrangedSubview(self.duratonLbl)


        
    }


}
