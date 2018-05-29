//
//  User.swift
//  DevChat
//
//  Created by Mina Guirguis on 5/27/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import UIKit

struct User {
    private var _firstName: String
    private var _uid: String
    
    var firstName: String {
        return _firstName
    }
    
    var uid: String {
        return _uid
    }
    
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
    
    
}
