//
//  AlbumImages.swift
//  ArtistsInTableView
//
//  Created by DANIEL THOMPSON on 3/28/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit


class AlbumImages: NSObject {
    
    let albumImage: AnyObject
    
    init(albumImage: AnyObject) {
        self.albumImage = albumImage
        super.init()
    }
    
    func height() ->Int?{
        if let h = albumImage["height"]{
            return h as? Int
        }
        return nil
    }
    
    func type() -> String?{
        if let t = albumImage["type"]{
            return t as? String
        }
        return nil
    }
    
    func albumID() -> Int?{
        if let a = albumImage["album_id"]{
            return a as? Int
        }
        return nil
    }
    
    func width() -> Int?{
        if let w = albumImage["width"]{
            return w as? Int
        }
        return nil
    }
    
    func uri() -> String?{
        if let u = albumImage["uri"]{
            return u as? String
        }
        return nil
    }
    
    
}
