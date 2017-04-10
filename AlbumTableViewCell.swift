//
//  AlbumTableViewCell.swift
//  ArtistsInTableView
//
//  Created by DANIEL THOMPSON on 3/27/17.
//  Copyright © 2017 SSU. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func useAlbum(_ album: Album) {
        cellLabel.text = album.title()
    }
    
    func useAlbumImage(_ album: Album, aid: AlbumImagesDataSource) {
        if let alImage = album.getImage(alIDS: aid, alID: album.albumId()!) {
            cellImage.image = alImage
        }
    }
    
    func getImage() -> UIImage{
        return cellImage.image!
    }
    
    
}
