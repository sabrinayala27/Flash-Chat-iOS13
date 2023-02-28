//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Sabrina Ayala on 31/01/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

struct K {
    static let appTitle = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
        static let error = "Error signing out: %@"
    }
}
