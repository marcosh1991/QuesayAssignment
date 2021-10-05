//
//  User.swift
//  Quesay
//
//  Created by Marco Shin on 10/3/21.
//

import UIKit

struct User: Hashable {
    var username: String
    var country: String
    var age: Int
    var profilePicture: UIImage
    var likedPosts: [Post]
    var posts: [Post]
}
