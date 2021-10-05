//
//  Examples.swift
//  Quesay
//
//  Created by Marco Shin on 10/5/21.
//

import UIKit

struct Examples {
    let posts: [Post] = [
        Post(title: "Young Soul Worn Heart",
             content: """
                soul and heart
                traces of time appear separately
                young and worn
                opposite words composes a symphony
                time is a circle
                the shape symbolizing divinity
             """,
             artWorkImage: UIImage(named: "example1")!,
             isLiked: false,
             userPosted: User(username: "Kevin", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: [])),
        Post(title: "Time Is a Circle",
             content: """
                opposite words composes a symphony
                time is a circle
                soul and heart
                traces of time appear separately
                young and worn
                the shape symbolizing divinity
             """,
             artWorkImage: UIImage(named: "example2")!,
             isLiked: false,
             userPosted: User(username: "Kim", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: []))
        ,
        Post(title: "Traces of Time Appear Separately",
             content: """
                traces of time appear separately
                young and worn
                opposite words composes a symphony
                soul and heart
                time is a circle
                the shape symbolizing divinity
             """,
             artWorkImage: UIImage(named: "example3")!,
             isLiked: false,
             userPosted: User(username: "Kate", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: [])),
        Post(title: "Young Soul Worn Heart",
             content: """
                soul and heart
                traces of time appear separately
                young and worn
                opposite words composes a symphony
                time is a circle
                the shape symbolizing divinity
             """,
             artWorkImage: UIImage(named: "example4")!,
             isLiked: false,
             userPosted: User(username: "Christine", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: [])),
        Post(title: "Time Is a Circle",
             content: """
                opposite words composes a symphony
                time is a circle
                soul and heart
                traces of time appear separately
                young and worn
                the shape symbolizing divinity
             """,
             artWorkImage: UIImage(named: "example5")!,
             isLiked: false,
             userPosted: User(username: "Kaleb", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: [])),
        Post(title: "The Shape Symbolizing Divinity",
             content: """
                 time is a circle
                 the shape symbolizing divinity
                 soul and heart
                 traces of time appear separately
                 young and worn
                 opposite words composes a symphony
             """,
             artWorkImage: UIImage(named: "example6")!,
             isLiked: false,
             userPosted: User(username: "Luna", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: [])),
        Post(title: "Soul Worn Heart",
             content: """
                opposite words composes a symphony
                time is a circle
                soul and heart
                traces of time appear separately
                young and worn
                the shape symbolizing divinity
             """,
             artWorkImage: UIImage(named: "example7")!,
             isLiked: false,
             userPosted: User(username: "Kate", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: [])),
        Post(title: "Time Is a Circle",
             content: """
                soul and heart
                traces of time appear separately
                young and worn
                opposite words composes a symphony
                time is a circle
                the shape symbolizing divinity
             """,
             artWorkImage: UIImage(named: "example8")!,
             isLiked: false,
             userPosted: User(username: "Kenny", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: [])),
        Post(title: "Young And Worn",
             content: """
                the shape symbolizing divinity
                soul and heart
                traces of time appear separately
                young and worn
                opposite words composes a symphony
                time is a circle
             """,
             artWorkImage: UIImage(named: "example9")!,
             isLiked: false,
             userPosted: User(username: "Kate", country: "", age: 0, profilePicture: UIImage(systemName: "person.circle.fill")!, likedPosts: [], posts: []))
    ]
}
