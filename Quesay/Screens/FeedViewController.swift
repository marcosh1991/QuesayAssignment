//
//  FeedViewController.swift
//  Quesay
//
//  Created by Marco Shin on 10/3/21.
//

import UIKit



class FeedViewController: UIViewController {
        
    enum Section {
        case main
    }
    
    var posts: [Post]   = []
    var page            = 1
    var hasMorePosts    = true
    
    var feedTableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, Post>!
    
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
        feedTableView                   = UITableView(frame: view.bounds)
        feedTableView.separatorStyle    = .none
        feedTableView.allowsSelection   = false
        feedTableView.backgroundColor   = UIColor(named: "BackgroundWhite")
        view.addSubview(feedTableView)
        
        feedTableView.delegate          = self
        feedTableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource      = UITableViewDiffableDataSource<Section, Post>(tableView: feedTableView, cellProvider: { (tableView, indexPath, posts) -> UITableViewCell? in
            let cell                                = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseID, for: indexPath) as! PostCell
            cell.set(post: posts)
            cell.feedCard.bookmarkButton.isHidden   = true
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
        if hasMorePosts == false { return }
        let nextPosts: [Post] = [Examples().posts[page*2-2], Examples().posts[page*2-1]]
        if Examples().posts.count - page*2 < 2  { self.hasMorePosts = false }
        self.posts.append(contentsOf: nextPosts)
        self.updateData(on: self.posts)
    }
}

extension FeedViewController: UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMorePosts else { return }
            page += 1
            getPosts(page: page)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
