//
//  ArtistDetailedViewController.swift
//  ArtistsInTableView
//
//  Created by AAK on 3/11/16.
//  Copyright © 2016 SSU. All rights reserved.
//

import UIKit

class ArtistDetailedViewController: UIViewController {
    
    var artist: Artist?

    @IBOutlet weak var profileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let a = artist {
            self.profileLabel.text = a.artistProfile()
        }
    }
    
    func artistForThisView(_ artist: Artist) {
        self.artist = artist
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
