//
//  InfoViewController.swift
//  Navigation
//
//  Created by Murat Kurbanov on 30.06.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Посмотреть", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Инфо"
        view.backgroundColor = .white
        view.addSubview(actionButton)
        layout()
    }
    
    
    
    @objc func alertViewController(_ sender: UIAlertController) {
        let alertController = UIAlertController(title: "Информация для информации", message: "Важная информация, котороая написана, чтобы проинформировать вас.", preferredStyle: .alert)

        let action1 = UIAlertAction(title: "Отлично", style: .default) {_ in
            print("Нажал на кнопку <Отлично>")
        }
        let action2 = UIAlertAction(title: "Не отлично", style: .default) {_ in
            print("Нажал на кнопку <Не отлично>")
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true)
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

        actionButton.addTarget(self, action: #selector(alertViewController(_:)), for: .touchUpInside)
    }
    
//    @objc func buttonPressed(_ sender: UIButton) {
//        let alert = alertViewController.self
//        present(alert.alertController, animated: true)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
