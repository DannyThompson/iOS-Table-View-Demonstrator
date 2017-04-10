//
//  AlbumImagesDataSource.swift
//  ArtistsInTableView
//
//  Created by DANIEL THOMPSON on 3/28/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class AlbumImagesDataSource: NSObject {
    
    var albumImages: [AnyObject]
    
    init(dataSource: [AnyObject]) {
        albumImages = dataSource
        super.init()
    }
    
    func numImages() -> Int{
        return albumImages.count
    }
    
    func imageAt(_ index: Int) -> AlbumImages {
        let albumImage = AlbumImages( albumImage: albumImages[index] )
        return albumImage
    }

    
}
