//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Murat Kurbanov on 09.07.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    
    private lazy var secondButton: UIButton = {
        let buttonSec = UIButton()
        buttonSec.translatesAutoresizingMaskIntoConstraints = false
        buttonSec.layer.cornerRadius = 16
        buttonSec.backgroundColor = .black
        buttonSec.setTitle("Доп. кнопка", for: .normal)
        buttonSec.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        buttonSec.layer.shadowOpacity = 0.4
        buttonSec.layer.shadowRadius = 4.0
        buttonSec.layer.shadowColor = UIColor.black.cgColor
        return buttonSec
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        title = "Профиль"
        view.addSubview(profileHeaderView)
        view.addSubview(secondButton)
        
        setupConstraints()
    }
     // MARK: - Constraints
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            // MARK: - Constraints / 

            view.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 0.0),
            view.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: 0.0),
//            view.heightAnchor.constraint(equalToConstant: 220.0),
            
            secondButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -16),
            secondButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            secondButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            secondButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
}
