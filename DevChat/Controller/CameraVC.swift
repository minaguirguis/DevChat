//
//  ViewController.swift
//  DevChat
//
//  Created by Mina Guirguis on 5/21/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController {

    @IBOutlet weak var previewView: PreviewView!
    

    override func viewDidLoad() {
        _previewView = previewView
        super.viewDidLoad()
    }

  


}

