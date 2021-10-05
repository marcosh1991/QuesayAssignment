//
//  ProfileVIewController.swift
//  Quesay
//
//  Created by Marco Shin on 10/3/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let headerView          = UIView()
    let feedView            = UIView()
    var itemViews: [UIView] = []
    var currentUser: User!
    var userPosts: [Post]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
        getFeed()
        print(view.frame.width)
    }
    
    func configureViewController() {
        view.backgroundColor = UIColor(named: "BackgroundWhite")
    }
    
    func getUserInfo() {
        currentUser = User(username: "Kate", country: "United States", age: 18, profilePicture: UIImage(systemName: "person")!, likedPosts: [], posts: [])
        DispatchQueue.main.async {
            self.add(childVC: QSUserInforHeaderVC(user: self.currentUser), to: self.headerView)
        }
    }
    
    func getFeed() {
        userPosts = Examples().posts.filter { $0.userPosted.username == currentUser.username}
        currentUser.posts = userPosts
        DispatchQueue.main.async {
            self.add(childVC: QSUserFeedVC(posts: self.userPosts), to: self.feedView)
        }
    }
    
    func layoutUI() {
        
        view.addSubview(headerView)
        view.addSubview(feedView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        feedView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            feedView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            feedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
