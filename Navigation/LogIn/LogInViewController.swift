//
//  LogInViewController.swift
//  Navigation
//
//  Created by Murat Kurbanov on 20.09.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - UIView
    
    private lazy var logoVK: UIImageView = {
        let logoVKSignIn = UIImageView()
        logoVKSignIn.translatesAutoresizingMaskIntoConstraints = false
        logoVKSignIn.image = UIImage(named: "logoVK")
        logoVKSignIn.layer.cornerRadius = 12
        
        return logoVKSignIn
    }()
    
    private lazy var inputTextFieldView: UIView = {
        let inputTextFieldView = UIView()
        inputTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        inputTextFieldView.backgroundColor = .systemGray6
        inputTextFieldView.layer.masksToBounds = true
        inputTextFieldView.layer.cornerRadius = 10
        inputTextFieldView.layer.borderWidth = 0.5
        inputTextFieldView.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        
        return inputTextFieldView
    }()
    
    private lazy var underlineView: UIView = {
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.layer.borderColor = UIColor(named: "lightGray")?.cgColor
        underlineView.layer.borderWidth = 0.5
        underlineView.backgroundColor = .systemGray6
        return underlineView
    }()
    
    private lazy var inputEmailTextFiels: UITextField = {
        
        let inputEmailTextFiels = UITextField()
        inputEmailTextFiels.translatesAutoresizingMaskIntoConstraints = false
        inputEmailTextFiels.font = UIFont.systemFont(ofSize: 16)
        inputEmailTextFiels.textColor = .black
        inputEmailTextFiels.tintColor = UIColor(named: "accentColor")
        inputEmailTextFiels.autocapitalizationType = .none
        inputEmailTextFiels.placeholder = "E-mail или телефон"
        
        inputEmailTextFiels.delegate = self
        
        let paddinginputTextFiels = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        inputEmailTextFiels.leftView = paddinginputTextFiels
        inputEmailTextFiels.leftViewMode = .always
        inputEmailTextFiels.keyboardType = UIKeyboardType.default
//        inputEmailTextFiels.returnKeyType = UIReturnKeyType.next
        inputEmailTextFiels.clearButtonMode = UITextField.ViewMode.whileEditing
        
        return inputEmailTextFiels
    }()
    
    private lazy var inputPasswordTextField: UITextField = {
        let inputPasswordTextField = UITextField()
        inputPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        inputPasswordTextField.textColor = .black
        inputPasswordTextField.font = UIFont.systemFont(ofSize: 16)
        inputPasswordTextField.tintColor = UIColor(named: "accentColor")
        inputPasswordTextField.isSecureTextEntry = true
        inputPasswordTextField.placeholder = "Пароль"
        
        inputPasswordTextField.delegate = self
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        inputPasswordTextField.leftView = paddingView
        inputPasswordTextField.leftViewMode = .always
        inputPasswordTextField.keyboardType = UIKeyboardType.default
//        inputPasswordTextField.returnKeyType = UIReturnKeyType.done
        inputPasswordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        
        return inputPasswordTextField
    }()
    
    private lazy var buttonLogIn: UIButton = {
        let buttonLogIn = UIButton(type: .system)
        buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
        buttonLogIn.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        buttonLogIn.setTitleColor(.white, for: .normal)
        buttonLogIn.layer.cornerRadius = 10
        buttonLogIn.setTitle("Войти", for: .normal)
        buttonLogIn.clipsToBounds = true
        
        return buttonLogIn
    }()
    
    // MARK: - Content and scroll Views
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        buttonLogIn.addTarget(self, action: #selector(logInButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSubview()
        setupConstraints()
        setupKeyboardObservers()
//        view.layoutIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    // MARK: - Functions
    
    @objc func logInButtonPressed(_ sender: UIButton) {
        let profileViewController = ProfileViewController()
        profileViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    
    // MARK: - Constraints
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: - Constraints /
            
            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            
            inputTextFieldView.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            inputTextFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            inputTextFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            inputTextFieldView.heightAnchor.constraint(equalToConstant: 100),
            
            underlineView.topAnchor.constraint(equalTo: inputEmailTextFiels.bottomAnchor, constant: -0.5),
            underlineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            underlineView.bottomAnchor.constraint(equalTo: inputPasswordTextField.topAnchor, constant: 0.5),
            underlineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            inputEmailTextFiels.topAnchor.constraint(equalTo: inputTextFieldView.topAnchor),
            inputEmailTextFiels.leadingAnchor.constraint(equalTo: inputTextFieldView.leadingAnchor),
            inputEmailTextFiels.trailingAnchor.constraint(equalTo: inputTextFieldView.trailingAnchor),
            inputEmailTextFiels.heightAnchor.constraint(equalToConstant: 50),
            
            inputPasswordTextField.topAnchor.constraint(equalTo: inputEmailTextFiels.bottomAnchor),
            inputPasswordTextField.leadingAnchor.constraint(equalTo: inputTextFieldView.leadingAnchor),
            inputPasswordTextField.trailingAnchor.constraint(equalTo: inputTextFieldView.trailingAnchor),
            inputPasswordTextField.heightAnchor.constraint(equalToConstant: 50),

            buttonLogIn.topAnchor.constraint(equalTo: inputTextFieldView.bottomAnchor, constant: 16),
            buttonLogIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            buttonLogIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            buttonLogIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoVK)
        contentView.addSubview(buttonLogIn)
        contentView.addSubview(inputTextFieldView)
        inputTextFieldView.addSubview(inputEmailTextFiels)
        inputTextFieldView.addSubview(inputPasswordTextField)
        inputTextFieldView.addSubview(underlineView)
        
        
    }
    
}

// MARK: - Extension
extension LogInViewController: UITextFieldDelegate {
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func willShowKeyboard(_ notificator: NSNotification) {
        let keyboardHeight = (notificator.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notificator: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    private func removeKeyboardObservers(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    func textFieldShouldReturn(
        _ inputTextFieldView: UITextField
    ) -> Bool {
        inputTextFieldView.resignFirstResponder()
        
        return true
    }
}
