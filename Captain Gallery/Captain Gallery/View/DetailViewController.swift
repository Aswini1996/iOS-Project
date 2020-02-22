//
//  DetailViewController.swift
//  Captain Gallery
//
//  Created by Home on 7/30/19.
//  Copyright © 2019 Asiwni. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    var imageName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Steve"
        detailImage.image = UIImage(named: imageName)
    }
}
