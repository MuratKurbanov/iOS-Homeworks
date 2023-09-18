//
//  FeedViewController.swift
//  Navigation
//
//  Created by Murat Kurbanov on 29.06.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()

    let post = Post(title: "Новый пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(actionButton)
       layout()
        
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let postViewController = PostViewController(post: post)
//        postViewController.post = post
        postViewController.modalTransitionStyle = .coverVertical // flipHorizontal
        postViewController.modalPresentationStyle = .pageSheet // pageSheet
        
//        present(postViewController, animated: true)
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    func layout() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            actionButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            actionButton.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
                ),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
            
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
