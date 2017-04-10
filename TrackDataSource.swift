//
//  TrackDataSource.swift
//  ArtistsInTableView
//
//  Created by DANIEL THOMPSON on 3/28/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class TrackDataSource: NSObject {

    var tracks: [AnyObject]
    
    init(dataSource: [AnyObject]) {
        tracks = dataSource
        super.init()
    }
    
    func numTracks() -> Int{
        return tracks.count
    }
    
    func trackAt(_ index: Int) -> Track {
        let track = Track( track: tracks[index] )
        return track
    }

    
}
