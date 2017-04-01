//
//  AuthorCell.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class AuthorCell: UITableViewCell {

    @IBOutlet weak var directorsView: UIView!
    var directorsController: DirectorsCollectionViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let collectionController = UIStoryboard(name: "Crew", bundle: Bundle.main).instantiateViewController(withIdentifier: "DirectorsCollectionViewController") as! DirectorsCollectionViewController
        self.directorsController = collectionController
        collectionController.view.frame = self.directorsView.bounds
        self.directorsView.addSubview(collectionController.view)
    }

    var item: MTCastResponse! {
        didSet {
            self.directorsController.directors = self.item.crew
            self.directorsController.collectionView?.reloadData()
        }
    }
    
}
