//
//  QSFeedCard.swift
//  Quesay
//
//  Created by Marco Shin on 10/4/21.
//

import UIKit

class QSFeedCard: UIView {
    
    let postImage           = QSFeedPostImageView(frame: .zero)
    let userProfilePicture  = QSProfileImageView(frame: .zero)
    let userName            = QSBioTagLabel(textAlignment: .left)
    let titleLabel          = QSContentTitleLabel(textAlignment: .left, fontSize: 20)
    let bodyLabel           = QSContentBodyLabel(textAlignment: .left)
    let contentView         = QSFeedPostContentView(frame: .zero)
    let bookmarkButton      = QSBookMarkButton(frame: .zero)
    var isBookmarked        = false
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
        configureCardUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(post: Post) {
        postImage.setImage(newImage: post.artWorkImage)
        userProfilePicture.setImage(newImage: post.userPosted.profilePicture)
        userName.text   = post.userPosted.username
        titleLabel.text = post.title
        bodyLabel.text  = post.content
        bookmarkButton.addTarget(self, action: #selector(bookmarkPressed), for: .touchUpInside)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints   = false
        layer.cornerRadius                          = 10
        layer.shadowOpacity                         = 0.3
        layer.shadowOffset                          = CGSize(width: 5, height: 10)
        layer.shadowRadius                          = 5
        clipsToBounds                               = true
    }
    
    private func configureCardUI() {
        let views = [postImage, contentView, userProfilePicture, userName, titleLabel, bodyLabel, bookmarkButton]
        for view in views {
            addSubview(view)
        }
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: topAnchor),
            postImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImage.widthAnchor.constraint(equalTo: widthAnchor),
            postImage.heightAnchor.constraint(equalTo: widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: postImage.topAnchor, constant: 120),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            
            bookmarkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 40),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -padding),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            
            userName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            userName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userName.heightAnchor.constraint(equalToConstant: 38),

            userProfilePicture.centerYAnchor.constraint(equalTo: userName.centerYAnchor),
            userProfilePicture.trailingAnchor.constraint(equalTo: userName.leadingAnchor, constant: -5),
            userProfilePicture.widthAnchor.constraint(equalToConstant: 30),
            userProfilePicture.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @IBAction func bookmarkPressed() {
        isBookmarked = !isBookmarked
        isBookmarked == true ?
            bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal) :
            bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
}
