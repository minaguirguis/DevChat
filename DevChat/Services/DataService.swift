//
//  DataService.swift
//  DevChat
//
//  Created by Mina Guirguis on 5/25/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService { // created instance
        return _instance
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var usersRef: DatabaseReference {
        return mainRef.child(USERS_REF)
    }
    
    var mainStorageRef: StorageReference {
        return Storage.storage().reference(forURL: "gs://devchat-71f15.appspot.com/")
    }
    
    var imagesStorageRef: StorageReference {
        return mainStorageRef.child(IMAGES_STORAGE_REF)// "images"
    }
    
    var videoStorageRef: StorageReference {
        return mainStorageRef.child(VIDEOS_STORAGE_REF)//"videos"
    }
    
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firestName": "" as AnyObject, "lastName": "" as AnyObject]
        
        mainRef.child(USERS_REF).child(uid).child(PROFILE_REF).setValue(profile)
    }
    
    func sendMediaPullRequest(senderUID: String,  sendingTo: Dictionary<String, User>, mediaURL: URL, textSnippet: String? = nil) {
        
        var uids = [String]()
        for uid in sendingTo.keys {
            uids.append(uid)
        }
        var pr: Dictionary<String, AnyObject> = ["mediaURL": mediaURL.absoluteString as AnyObject, "userID": senderUID as AnyObject, "openCount": 0 as AnyObject, "recipients": uids as AnyObject]
        
        mainRef.child(PULL_REQUESTS_REF).childByAutoId().setValue(pr)
        
        
    }
}
