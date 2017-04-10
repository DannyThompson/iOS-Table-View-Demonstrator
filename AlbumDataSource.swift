//
//  AlbumDataSource.swift
//  ArtistsInTableView
//
//  Created by DANIEL THOMPSON on 3/27/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class AlbumDataSource: NSObject {
    
    var albums: [AnyObject]
    
    init(dataSource: [AnyObject], artistId: Int) {
        albums = dataSource
        super.init()
        artistsAlbums(artistId: artistId)
    }
    
    func numAlbums() -> Int{
        return albums.count
    }
    
    func albumAt(_ index: Int) -> Album {
        let album = Album( album: albums[index] )
        return album
    }
    
    func artistsAlbums(artistId: Int){
        var artistsAlbums = [AnyObject]()
        for i in albums {
            let album = Album(album: i)
            if album.artistId() == artistId{
                artistsAlbums.append(i)
            }
            albums = artistsAlbums
        }
        
    }
    
}

