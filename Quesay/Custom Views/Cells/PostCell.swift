//
//  PostCell.swift
//  Quesay
//
//  Created by Marco Shin on 10/4/21.
//

import UIKit

class PostCell: UITableViewCell {

    static let reuseID = "PostCell"
    
    let feedCard        = QSFeedCard(frame: .zero)
    let mirrorButton    = QSMirrorButton(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureCardUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(post: Post) {
        feedCard.set(post: post)
    }
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius  = 10
        backgroundColor     = UIColor(named: "BackgroundWhite")
        layer.masksToBounds = false
        clipsToBounds       = true
    }
    
    private func configureCardUI() {
        let padding: CGFloat = 20
        
        contentView.addSubview(feedCard)
        contentView.addSubview(mirrorButton)
        
        NSLayoutConstraint.activate([
            feedCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            feedCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            feedCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            feedCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            
            mirrorButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            mirrorButton.centerYAnchor.constraint(equalTo: feedCard.bottomAnchor),
            mirrorButton.heightAnchor.constraint(equalToConstant: 30),
            mirrorButton.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
}
