//
//  AlbumTableViewController.swift
//  ArtistsInTableView
//
//  Created by DANIEL THOMPSON on 3/8/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    
    var artistViewId: Int? //Additional var to get the specific artist's ID
    var albumsDS: AlbumDataSource?
    var imageDS: AlbumImagesDataSource?
    var trackDS: TrackDataSource?

    var downloadAssistant = Download(withURLString: "https://www.cs.sonoma.edu/~kooshesh/cs470/albums.json")
    var imageDownloadAssistant = Download(withURLString: "https://www.cs.sonoma.edu/~kooshesh/cs470/albumImages.json")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        downloadAssistant.addObserver(self, forKeyPath: "dataFromServer", options: .old, context: nil)
        downloadAssistant.download_request()
        title = "Albums"
    }
    
    func artistForThisView(artist: Artist){
        if let _ = artist.artistName(){
            artistViewId = artist.artistId()!
        }
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        albumsDS = AlbumDataSource(dataSource: downloadAssistant.dataFromServer!, artistId: artistViewId!)
        
        //Now Download the Images
        imageDownloadAssistant.download_request()
        imageDS = AlbumImagesDataSource(dataSource: imageDownloadAssistant.dataFromServer!)
        
        
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    deinit {
        downloadAssistant.removeObserver(self, forKeyPath: "dataFromServer", context: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let ads = albumsDS {
            return ads.numAlbums()
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        
        if let theCell = cell as? AlbumTableViewCell, let album = albumsDS?.albumAt(indexPath.row) {
                theCell.useAlbum(album)
            if imageDS != nil{
                theCell.useAlbumImage(album, aid: imageDS!)
            }
        }
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "albumToTrack" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let album = albumsDS?.albumAt(row)
                let detailedVC = segue.destination as! AlbumDetailedViewController
                detailedVC.albumForThisView(album!, imageDS )
            }
 
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            }
    
        }
}

