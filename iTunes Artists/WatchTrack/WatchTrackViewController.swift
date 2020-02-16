//
//  WatchTrackViewController.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 09/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class WatchTrackViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    var watchTrackVM: WatchTrackViewModelType?
    
    override func viewDidAppear(_ animated: Bool) {
        viewSettup()
    }
    
    func viewSettup() {
        guard let urlString = watchTrackVM?.url else { return }
        if let url = URL(string: urlString) {
            let player = AVPlayer(url: url)
            let controller = AVPlayerViewController()
            controller.player = player
            controller.view.frame = self.videoPlayerView.frame
            self.videoPlayerView.addSubview(controller.view)
            self.addChildViewController(controller)
        }
        self.songTitle.text = watchTrackVM?.trackTitle
        self.artistName.text = watchTrackVM?.artistName
    }
    
    // This sometimes does not work on the simulator
    @IBAction func sendToArtistPage(_ sender: Any) {
        guard let urlString = watchTrackVM?.artistViewURL else { return }
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }

}
