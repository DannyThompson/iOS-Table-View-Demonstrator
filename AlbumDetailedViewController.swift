//
//  AlbumDetailedViewController.swift
//  albumsInTableView
//
//  Created by DANIEL THOMPSON on 3/27/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class AlbumDetailedViewController: UIViewController {
    
    
    @IBOutlet weak var albumImage: UIImageView!
    
    var album: Album?
    var imageDS: AlbumImagesDataSource?
    var alImages = [UIImage]()
    var tracks = [Track]()
    var tracksId: Int?
    var trackDS: TrackDataSource?
    var trackDownloadAssistant = Download(withURLString: "https://www.cs.sonoma.edu/~kooshesh/cs470/tracks.json")

    @IBOutlet weak var profileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trackDownloadAssistant.addObserver(self, forKeyPath: "dataFromServer", options: .old, context: nil)
        trackDownloadAssistant.download_request()

        title = "Tracks"
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        trackDS = TrackDataSource(dataSource: trackDownloadAssistant.dataFromServer!)
        displayTracksAndImage()
    }
    
    /* Function that:
     * 1) Displays the tracks by filtering out tracks by album, then loops again
     *    to correctly get the number the track is within its album, instead of the weird position 
     *    format.
     * 2) Simply gets the image for the album to display it on the tracks page as well.
     * This was done the easy way, and thus it is possible for text to go offscreen for long titles.
     */
    func displayTracksAndImage(){
        var yVal = 200
        for j in 0 ..< (trackDS?.tracks.count)!{
            if trackDS?.trackAt(j).albumId() == album?.albumId(){
            tracks.append((trackDS?.trackAt(j))!)
            }
        }
        
        for i in 0 ..< tracks.count{
            if album?.albumId() == tracks[i].albumId(){
                let label = UILabel(frame: CGRect(x: 17, y: yVal, width: 500, height: 100))
                //Check if duration is empty. If it is, dont attempt to print.
                if tracks[i].duration() != "" {
                label.text = ("\(i+1). \(tracks[i].title()!) - \(tracks[i].duration()!)")
                }
                else{
                    label.text = ("\(i+1). \(tracks[i].title()!)")
                }
                view.addSubview(label)
            }
            yVal = yVal + 25
        }
        
        if let albIm = album?.getImage(alIDS: imageDS!, alID: (album?.albumId()!)!){
            albumImage.image = albIm
        }
        
    }
    
    func albumForThisView(_ album: Album, _ imageDS: AlbumImagesDataSource? ){
            self.album = album
            self.imageDS = imageDS
        
        
    }
    


    deinit {
        trackDownloadAssistant.removeObserver(self, forKeyPath: "dataFromServer", context: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

