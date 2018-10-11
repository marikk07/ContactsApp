//
//  UserDefaultsManager.swift
//  SaQure
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import Foundation

struct UserDefaultsManager: UserInfoContainer {
    private enum Keys {
        static let isFacebookUser = (Bundle.main.bundleIdentifier ?? "") + "." + "shouldReadJSONFile"
    }
    
    var shouldReadJSONFile: Bool? {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isFacebookUser)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.isFacebookUser)
        }
    }
}
