//
//  Post.swift
//  Quesay
//
//  Created by Marco Shin on 10/3/21.
//

import UIKit

struct Post: Hashable {
    var title: String
    var content: String
    var artWorkImage: UIImage
    var isLiked: Bool
    var userPosted: User
}
