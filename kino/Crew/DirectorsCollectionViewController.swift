//
//  DirectorsCollectionViewController.swift
//  kino
//
//  Created by K on 01/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "DirectorCell"

class DirectorsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var directors: [MTDirectors]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.directors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DirectorsCollectionViewCell
        cell.item = self.directors[indexPath.row]
        return cell
    }

    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = CGFloat(UIScreen.main.bounds.width / 2.5)
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
}
