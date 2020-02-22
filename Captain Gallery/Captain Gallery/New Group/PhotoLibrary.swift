//
//  PhotoLibrary.swift
//  Captain Gallery
//
//  Created by Home on 7/30/19.
//  Copyright © 2019 Asiwni. All rights reserved.
//

import Foundation
struct PhotoCatagory {
    var photoCatagoryImageName: String
    var title: String
    var PhotoImageNames: [String]
}

class PhotoLibrary {
    private class func generateImageName(count: Int) -> [String] {
        var names = [String]()
        for _ in 1...count {
            names.append("Captain-America")
        }
        return names
    }
    class func generatePhotoLibrary() -> [PhotoCatagory] {
        var photoLibrary =  [PhotoCatagory]()
        for _ in 1...5 {
            photoLibrary.append(PhotoCatagory(photoCatagoryImageName: "LogoCaptain", title: "CAPTAIN AMERICA", PhotoImageNames: generateImageName(count: 8)))
        }
        
        return photoLibrary
    }
}
