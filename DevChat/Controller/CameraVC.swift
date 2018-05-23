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
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var cameraBtn: UIButton!
    
    override func viewDidLoad() {
        _previewView = previewView
        _cameraButton = cameraBtn
        _recordButton = recordBtn
        super.viewDidLoad()
    }

  
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
}

