//
//  Album.swift
//  albumsInTableView
//
//  Created by DANIEL THOMPSON on 3/27/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class Album: NSObject {
    
    let album: AnyObject

    init(album: AnyObject) {
        self.album = album
        super.init()
    }
    
    func title() -> String? {
        if let a = album["title"] {
            return a as? String
        }
        return nil
    }
    
    func year() -> String? {
        if let y = album["year"] {
            return y as? String
        }
        return nil
    }
    
    func genres() -> String? {
        if let g = album["genres"] {
            return g as? String
        }
        return nil
    }
    
    func numTracks() -> Int? {
        if let n = album["num_tracks"] {
            return n as? Int
        }
        return nil
    }
    
    func albumId() -> Int? {
        if let ai = album["album_id"] {
            return ai as? Int
        }
        return nil
    }
    
    func artistId() -> Int? {
        if let aid = album["artist_id"] {
            return aid as? Int
        }
        return nil
    }
    
    func numImages() -> Int? {
        if let a = album["num_images"] {
            return a as? Int
        }
        return nil
    }
    

    func getImage(alIDS: AlbumImagesDataSource, alID: Int) ->UIImage? {
        var uri: String = ""
        for i in 0 ..< alIDS.albumImages.count {
            if let temp = alIDS.albumImages[i]["album_id"], let id = temp as? Int{
                if id == alID{
                    let uriString = alIDS.imageAt(i).uri()
                    uri = uriString! as String
                }
            }
        }

            if let url = URL(string: uri),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                return image
            }
        return nil
    }
}
