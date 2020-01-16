//
//  TrackListViewController+SkeletonView.swift
//  iTunes Artists
//
//  Created by Eduardo Leite on 09/01/20.
//  Copyright © 2020 eduardo. All rights reserved.
//

import Foundation
import SkeletonView

extension TrackListViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numSections(in collectionSkeletonView: UICollectionView) -> Int {
        return 1
    }
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "trackCell"
    }
}
