//
//  QSContentTitleLabel.swift
//  Quesay
//
//  Created by Marco Shin on 10/4/21.
//

import UIKit

class QSContentTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        textColor                                   = .black
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.75
        lineBreakMode                               = .byTruncatingTail // it will make it if too long like this: longTit...
        translatesAutoresizingMaskIntoConstraints   = false
    }
    
}
