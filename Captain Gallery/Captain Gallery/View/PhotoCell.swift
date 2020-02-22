//
//  PhotoCell.swift
//  Captain Gallery
//
//  Created by Home on 7/30/19.
//  Copyright © 2019 Asiwni. All rights reserved.
//

import UIKit

protocol VisualEffectViewDelegate: AnyObject {
    func onClickDelete(collectionViewCell: UICollectionViewCell)
}


class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    weak var visualEffectViewDelegate: VisualEffectViewDelegate!
    
    
    var isEditing: Bool = false {
        didSet {
            visualEffectView.isHidden = !isEditing
        }
    }
    var imageName: String! {
        didSet {
            imageView.image = UIImage(named: imageName)
            visualEffectView.isHidden = !isEditing
            
        }
    }
    @IBAction func onClickDeleteButton(_ sender: Any) {
        visualEffectViewDelegate.onClickDelete(collectionViewCell: self)
    }
    
}
