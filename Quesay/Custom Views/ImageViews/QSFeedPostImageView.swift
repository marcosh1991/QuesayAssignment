//
//  QSFeedPostImageView.swift
//  Quesay
//
//  Created by Marco Shin on 10/4/21.
//

import UIKit

class QSFeedPostImageView: UIImageView {
    let placeHolderImage = UIImage(systemName: "person.fill")
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: UIImage) {
        super.init(frame: .zero)
    }
    
    private func configure() {
        layer.cornerRadius                          = 10
        clipsToBounds                               = true
        image                                       = placeHolderImage
        translatesAutoresizingMaskIntoConstraints   = false
    }
    
    func setImage(newImage: UIImage) {
        DispatchQueue.main.async {
            self.image = newImage
        }
    }
}
