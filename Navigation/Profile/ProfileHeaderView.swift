//
//  ProfileHeaderview.swift
//  Navigation
//
//  Created by Murat Kurbanov on 09.07.2023.
//

import UIKit

class ProfileHeaderView: UIView {
//    avatarImageView,
//    fullNameLabel,
//    statusLabel,
//    statusTextField,
//    setStatusButton.
    
    
    
    
    // MARK: - UIView
    
    lazy var avatarImageView: UIView = {
        let avatarPicProfile = UIImage(named: "avatarImage")
        let avatarPic = UIImageView()
        avatarPic.image = avatarPicProfile
        avatarPic.translatesAutoresizingMaskIntoConstraints = false
        avatarPic.layer.borderColor = UIColor.white.cgColor
        avatarPic.layer.borderWidth = 3
        avatarPic.layer.cornerRadius = 45
        avatarPic.layer.contentsGravity = .resizeAspect
        avatarPic.layer.masksToBounds = true
        return avatarPic
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let fullName = UILabel()
        fullName.translatesAutoresizingMaskIntoConstraints = false
        fullName.text = "Мурат Курбанов"
        fullName.textColor = .black
        fullName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return fullName
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabelInfo = UILabel()
        statusLabelInfo.translatesAutoresizingMaskIntoConstraints = false
        statusLabelInfo.text = "Ожидаем что-то"
        statusLabelInfo.textColor = .systemGray
        statusLabelInfo.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return statusLabelInfo
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.setTitle("Показать статус", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        return button
    }()
    
    // MARK: - Initiolization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview()
        setupConstraints()
        setStatusButton.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        let safeAreaGuide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: - Constraints /
            
            safeAreaGuide.heightAnchor.constraint(equalToConstant: 220),
            
            avatarImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 24),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 56),
            setStatusButton.heightAnchor.constraint(equalToConstant: 48),
            setStatusButton.widthAnchor.constraint(equalToConstant: 375)
            
        ])
    }
    
    // MARK: - Events
    @objc
    private func tapOnButton() {
        print("Нажал на кнопку со статусом")
    }
    
    func addSubview() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
    }
}
