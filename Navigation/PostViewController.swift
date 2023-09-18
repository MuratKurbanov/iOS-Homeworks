//
//  PostViewController.swift
//  Navigation
//
//  Created by Murat Kurbanov on 29.06.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = post.title
        view.backgroundColor = .white
        
        let barButtonItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(infoViewController))
        
        navigationItem.rightBarButtonItem = barButtonItem

    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
//    @objc let infoViewController = InfoViewController()
    @objc func infoViewController(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        let navUiContoller = UINavigationController(rootViewController: infoViewController)
//        infoViewController.modalTransitionStyle = .coverVertical // flipHorizontal
        navUiContoller.modalPresentationStyle = .pageSheet // pageSheet
        
        present(navUiContoller, animated: true)
//        navigationController?.pushViewController(infoViewController, animated: true)
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

