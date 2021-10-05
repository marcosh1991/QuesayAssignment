//
//  QSUserFeedVC.swift
//  Quesay
//
//  Created by Marco Shin on 10/4/21.
//

import UIKit

class QSUserFeedVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var filteredPosts: [Post]   = []
    var page                    = 1
    var hasMorePosts            = true
    
    var feedTableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, Post>!
    
    init(posts: [Post]) {
        super.init(nibName: nil, bundle: nil)
        self.filteredPosts = posts
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        configureDataSource()
        getPosts(page: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configureViewController() {
        view.backgroundColor = UIColor(named: "BackgroundWhite")
    }
    
    func configureTableView() {
        feedTableView                   = UITableView()
        feedTableView.separatorStyle    = .none
        feedTableView.allowsSelection   = false
        feedTableView.backgroundColor   = UIColor(named: "BackgroundWhite")
        feedTableView.delegate          = self
        feedTableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseID)
        
        view.addSubview(feedTableView)
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feedTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, Post>(tableView: feedTableView, cellProvider: { (tableView, indexPath, posts) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseID, for: indexPath) as! PostCell
            cell.set(post: posts)
            cell.mirrorButton.isHidden = true
            return cell
        })
    }
    
    func updateData(on posts: [Post]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Post>()
        snapshot.appendSections([.main])
        snapshot.appendItems(posts)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func getPosts(page: Int) {
        self.updateData(on: self.filteredPosts)
    }
}

extension QSUserFeedVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
