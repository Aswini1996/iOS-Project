//
//  SectionHeaderView.swift
//  Captain Gallery
//
//  Created by Home on 7/30/19.
//  Copyright © 2019 Asiwni. All rights reserved.
//

import Foundation
import  UIKit
class SectionHeaderView: UICollectionReusableView
{
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    var headerData: PhotoCatagory! {
        didSet {
            headerImage.image = UIImage(named: headerData.photoCatagoryImageName)
            headerLabel.text = headerData.title
        }
    }
}
