//
//  FeedPostContentView.swift
//  Quesay
//
//  Created by Marco Shin on 10/4/21.
//

import UIKit

class QSFeedPostContentView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius  = 10
        backgroundColor     = .white
    }
}
