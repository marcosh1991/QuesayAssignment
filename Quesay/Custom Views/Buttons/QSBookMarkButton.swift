//
//  QSBookMarkButton.swift
//  Quesay
//
//  Created by Marco Shin on 10/5/21.
//

import UIKit

class QSBookMarkButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        backgroundColor                             = .white
        tintColor                                   = .black
        translatesAutoresizingMaskIntoConstraints   = false
        setImage(UIImage(systemName: "bookmark")!, for: .normal)
    }
}
