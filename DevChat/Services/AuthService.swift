//
//  AuthService.swift
//  DevChat
//
//  Created by Mina Guirguis on 5/23/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    if errorCode == AuthErrorCode.userNotFound {
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error  != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                            } else {
                                if user?.uid != nil {
                                    //sign in
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            onComplete?(nil, user)// passing in user's data
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    //handle all other errors
                    self.handleFirebaseError(error: error! as NSError , onComplete: onComplete)
                }
            } else {
                //Successfully logged in
                onComplete?(nil, user)//passing in user's data
            }
        }
    }
    
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print("MINA: \(error.debugDescription)")
        if let errorCode = AuthErrorCode(rawValue: error.code) {
            switch (errorCode) {
            case AuthErrorCode.invalidEmail:
                onComplete?("Invalid email address", nil)
                break
            case AuthErrorCode.wrongPassword:
                onComplete?("Invalid password", nil)
                break
            case AuthErrorCode.emailAlreadyInUse, AuthErrorCode.accountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use", nil)
                break
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
                break
            }
        }
    }
    
    
}
