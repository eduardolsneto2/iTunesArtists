//
//  TrackListViewController+TrackListVMDelegate.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 08/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation
import UIKit

extension TrackListViewController: TrackListViewModelDelegate {
    
    func didLoadData() {
        self.refreshControl.endRefreshing()
        self.trackListCollectionView.reloadData()
    }
    
    func setBackgroundView(withText text: String?, imageName: String) {
        self.refreshControl.endRefreshing()
        self.trackListCollectionView.reloadData()
        let image = UIImage(named: imageName)
        let backgroundViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "errorVC")
        guard let myView = backgroundViewController.view as? GenericErrorView else { return }
        if let textContent = text {
            myView.genericErrorText.text = textContent
        }
        if let errorImage = image {
            myView.genericErrorImage.image = errorImage
        }
        self.trackListCollectionView.backgroundView = myView
        self.trackListCollectionView.backgroundView?.isHidden = false
    }
    
    func showSkeleton() {
        self.view.showAnimatedGradientSkeleton()
    }
    func stopSkeleton() {
        self.view.stopSkeletonAnimation()
        self.view.hideSkeleton()
    }
}
