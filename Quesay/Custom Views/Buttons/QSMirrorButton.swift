//
//  QSMirrorButton.swift
//  Quesay
//
//  Created by Marco Shin on 10/5/21.
//

import UIKit

class QSMirrorButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius                          = 15
        layer.shadowRadius                          = 2
        layer.shadowOffset                          = CGSize(width: 1, height: 1)
        layer.shadowOpacity                         = 0.3
        backgroundColor                             = .white
        tintColor                                   = .black
        translatesAutoresizingMaskIntoConstraints   = false
        setImage(UIImage(systemName: "magnifyingglass")!, for: .normal)
    }
    
}
