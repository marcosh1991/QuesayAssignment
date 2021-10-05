//
//  QSUserInforHeaderVC.swift
//  Quesay
//
//  Created by Marco Shin on 10/3/21.
//

import UIKit

class QSUserInforHeaderVC: UIViewController {

    let profileImageView        = QSProfileImageView(frame: .zero)
    let userNameLabel           = QSPostTitleLabel(textAlignment: .left, fontSize: 34)
    let countryLabel            = QSPostBodyLabel(textAlignment: .left)
    let ageLabel                = QSPostBodyLabel(textAlignment: .left)
    let numberOfPostLabel       = QSPostBodyLabel(textAlignment: .left)
    
    let countryTagLabel         = QSBioTagLabel(textAlignment: .left)
    let ageTagLabel             = QSBioTagLabel(textAlignment: .left)
    let numberOfPostTagLabel    = QSBioTagLabel(textAlignment: .left)
    let bottomLine = UIView()
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureUIElements()
        layoutUI()
    }
    
    func configureUIElements() {
        userNameLabel.text                                      = user.username
        countryLabel.text                                       = user.country
        ageLabel.text                                           = String(user.age)
        numberOfPostLabel.text                                  = String(user.posts.count)
        countryTagLabel.text                                    = "Country"
        ageTagLabel.text                                        = "Age"
        numberOfPostTagLabel.text                               = "# of Posts"
        bottomLine.translatesAutoresizingMaskIntoConstraints    = false
        bottomLine.backgroundColor = .systemGray
    }
    
    func addSubViews() {
        view.addSubview(profileImageView)
        view.addSubview(userNameLabel)
        
        view.addSubview(countryTagLabel)
        view.addSubview(ageTagLabel)
        view.addSubview(numberOfPostTagLabel)
        
        view.addSubview(countryLabel)
        view.addSubview(ageLabel)
        view.addSubview(numberOfPostLabel)
        
        view.addSubview(bottomLine)
    }
    
    func layoutUI() {
        let padding: CGFloat            = 20
        let lightPadding: CGFloat       = 10
        let textImagePadding: CGFloat   = 12
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            
            userNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: textImagePadding),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            countryTagLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: padding),
            countryTagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            countryTagLabel.heightAnchor.constraint(equalToConstant: 20),
            
            numberOfPostTagLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: padding),
            numberOfPostTagLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            numberOfPostTagLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 5),
            numberOfPostTagLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ageTagLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: padding),
            ageTagLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageTagLabel.heightAnchor.constraint(equalToConstant: 20),
            
            countryLabel.topAnchor.constraint(equalTo: countryTagLabel.bottomAnchor, constant: lightPadding),
            countryLabel.centerXAnchor.constraint(equalTo: countryTagLabel.centerXAnchor),
            countryLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ageLabel.topAnchor.constraint(equalTo: countryTagLabel.bottomAnchor, constant: lightPadding),
            ageLabel.centerXAnchor.constraint(equalTo: ageTagLabel.centerXAnchor),
            ageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            numberOfPostLabel.topAnchor.constraint(equalTo: countryTagLabel.bottomAnchor, constant: lightPadding),
            numberOfPostLabel.centerXAnchor.constraint(equalTo: numberOfPostTagLabel.centerXAnchor),
            numberOfPostLabel.heightAnchor.constraint(equalToConstant: 20),

            bottomLine.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 15),
            bottomLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
