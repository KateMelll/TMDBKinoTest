//
//  ActorsCollectionViewController.swift
//  kino
//
//  Created by Kate on 01/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ActorCell"

class ActorsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var actors: [MTActors]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.actors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ActorsCollectionViewCell
        cell.item = self.actors[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = CGFloat(UIScreen.main.bounds.width / 2.5)
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
}
