//
//  TrackCollectionViewCell.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit
import AlamofireImage

class TrackCollectionViewCell: UICollectionViewCell {
    
    var trackVM: TrackViewModelType?
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var songsNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackTimeLabel: UILabel!
    
    func settup(track: Track) {
        self.trackVM = TrackViewModel(track: track)
        self.songsNameLabel.text = trackVM?.trackName
        self.artistNameLabel.text = trackVM?.artistName
        self.trackTimeLabel.text = trackVM?.trackTime
        guard let artworkURL = trackVM?.artworkURL else { return }
        self.trackImageView.image = UIImage()
        self.trackImageView.af_setImage(withURL: artworkURL)
    }
}
