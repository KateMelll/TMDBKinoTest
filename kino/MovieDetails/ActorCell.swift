//
//  ActorCell.swift
//  kino
//
//  Created by Kate on 30/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell {

    @IBOutlet weak var actorsView: UIView!
    var actorsController: ActorsCollectionViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        let collectionController = UIStoryboard(name: "Actors", bundle: Bundle.main).instantiateViewController(withIdentifier: "ActorsCollectionViewController") as! ActorsCollectionViewController
        self.actorsController = collectionController
        collectionController.view.frame = self.actorsView.bounds
        self.actorsView.addSubview(collectionController.view)
    }


    var item: MTCastResponse! {
        didSet {
            self.actorsController.actors = self.item.cast
            self.actorsController.collectionView!.reloadData()
        }
    }
}
