//
//  QSContentBodyLabel.swift
//  Quesay
//
//  Created by Marco Shin on 10/4/21.
//

import UIKit

class QSContentBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: 16, weight: .medium)
        configure()
    }
    
    private func configure() {
        textColor                                   = .black
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.75
        lineBreakMode                               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints   = false
        numberOfLines                               = 0
        
    }
}
