//
//  SongTableViewCell.swift
//  Tunley
//
//  Created by Angel Zambrano on 2/28/23.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    static let identifier = "SongTableViewCell"
    
    var songConverImageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .red
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    // this will hold the title and artists name
    var hsv: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 15 // ad
        return sv
    }()
    
    
    var songLbl: UILabel = {
        var lbl = UILabel()
        lbl.text = "Ice Cream"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
        
    }()
    
    var artistsLbl: UILabel = {
        var lbl = UILabel()
        lbl.text = "BLACKPINK & Selena Gomez"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
        
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    
    func configure(with track: Track) {
        songLbl.text = track.trackName
        artistsLbl.text = track.artistName

    }
    
    private func setUpViews() {
        
        contentView.addSubview(songConverImageView)
        
        NSLayoutConstraint.activate([
            songConverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            songConverImageView.widthAnchor.constraint(equalToConstant: 80),
            songConverImageView.heightAnchor.constraint(equalToConstant: 80),
            songConverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
        ])
        
        contentView.addSubview(hsv)
        
        
        NSLayoutConstraint.activate([
            hsv.leadingAnchor.constraint(equalTo: songConverImageView.trailingAnchor, constant: 15),
            hsv.topAnchor.constraint(equalTo: songConverImageView.topAnchor),
            hsv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        hsv.addArrangedSubview(songLbl)
        hsv.addArrangedSubview(artistsLbl)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
