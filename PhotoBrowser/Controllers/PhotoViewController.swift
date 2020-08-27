//
//  PhotoViewController.swift
//  PhotoBrowser
//
//  Created by Mithun Raj on 26/08/20.
//  Copyright © 2020 Mithun Raj. All rights reserved.
//

import Cocoa

class PhotoViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func selectImage(imageToBeShown: String) {
        imageView.image = NSImage(named: imageToBeShown)
    }
    
}
