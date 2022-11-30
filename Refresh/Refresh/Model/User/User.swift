//
//  User.swift
//  Refresh
//
//  Created by Usr_Prime on 29/11/22.
//

import UIKit

struct User: Codable {
    public let name: String?
    public let familyName: String?
    public let email: String?
    public let hasImage: Bool?
    public let imageURL: String?
    public var categories: [String?]?
    public var isLoggedIn: Bool = false
    
    public init (name: String?, familyName: String?, email: String?, hasImage: Bool?, imageURL: String?, categories: [String?]?, isLoggedIn: Bool) {
        self.name = name
        self.familyName = familyName
        self.email = email
        self.hasImage = hasImage
        self.imageURL = imageURL
        self.categories = categories
        self.isLoggedIn = isLoggedIn
    }
}
