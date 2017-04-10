//
//  Tracks.swift
//  ArtistsInTableView
//
//  Created by DANIEL THOMPSON on 3/28/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class Track: NSObject {

    
    let track: AnyObject
    
    init(track: AnyObject) {
        self.track = track
        super.init()
    }
    
    func title() -> String? {
        if let t = track["title"] {
            return t as? String
        }
        return nil
    }
    
    func albumName() -> String? {
        if let a = track["album_name"] {
            return a as? String
        }
        return nil
    }
    
    func artistName() -> String? {
        if let a = track["artist_name"] {
            return a as? String
        }
        return nil
    }
    
    func duration() -> String? {
        if let d = track["duration"] {
            return d as? String
        }
        return nil
    }
    
    func position() -> String? {
        if let t = track["position"] {
            return t as? String
        }
        return nil
    }
    
    func albumId() -> Int? {
        if let ai = track["album_id"] {
            return ai as? Int
        }
        return nil
    }

}
