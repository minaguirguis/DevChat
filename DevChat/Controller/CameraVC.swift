//
//  ViewController.swift
//  DevChat
//
//  Created by Mina Guirguis on 5/21/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: CameraViewController {

    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var livePhotoModeButton: UIButton!
    @IBOutlet weak var depthDataDeliveryButton: UIButton!
    @IBOutlet weak var captureModeControl: UISegmentedControl!
    override func viewDidLoad() {
        _previewView = previewView
        _cameraButton = cameraBtn
        _recordButton = recordBtn
        _photoButton = photoBtn
        _livePhotoModeButton = livePhotoModeButton
        _depthDataDeliveryButton = depthDataDeliveryButton
        _captureModeControl = captureModeControl
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        guard Auth.auth().currentUser != nil else{
            performSegue(withIdentifier: "LoginVC", sender: nil)
            return
        }
    }

  
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
    func videoRecordingFailed() {
        
        
    }
    
    override func videoRecordingComplete(_ videoURL: URL!) {
        performSegue(withIdentifier: USERSVC_SEGUE_IDENTIFIER, sender: ["videoURL": videoURL])
        
    }
    
    func snapshotFailed() {
        
    }
    
    override func snapshotTaken(_ snapshotData: Data!) {
        performSegue(withIdentifier: USERSVC_SEGUE_IDENTIFIER, sender: ["snapshotData": snapshotData])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let usersVC = segue.destination as? UsersVC {
            if let videoDict = sender as? Dictionary<String, URL> {//see the videoRecordingCompelte func
                let url = videoDict["videoURL"]
                usersVC.videoURL = url
            } else if let snapDict = sender as? Dictionary<String, Data> {
                let snapData = snapDict["snapshotData"]
                usersVC.snapData = snapData
            }
        }
    }
    
}

