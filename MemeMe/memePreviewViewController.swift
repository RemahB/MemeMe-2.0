//
//  memeDetaliedViewController.swift
//  MemeMe
//
//  Created by Remah on 01/12/2018.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class memePreviewViewController: UIViewController {
   
    @IBOutlet weak var imageView: UIImageView!
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = meme.memedImage
    }
        
    }
    

   
