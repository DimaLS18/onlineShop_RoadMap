//
//  UserStorage.swift
//  onlineShop_RoadMap
//
//  Created by Dima Kovrigin on 17.10.2022.
//

import Foundation

/// Global Constants.
enum ConstantsUser {
    static let isEntry = "firstEntry"
}

/// Storage for save and verify first entry.
final class UserStorage {
    
    static let shared = UserStorage()
    lazy var defaults = UserDefaults.standard
    
    func saveUser(forKey: String) {
        defaults.set(true, forKey: forKey)
    }
    
    func verifyUser(forKey: String) -> Bool {
        let isNewUser = defaults.bool(forKey: forKey)
        return isNewUser
    }
    
    private init() {}
}
