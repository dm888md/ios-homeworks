//
//  LogInViewController.swift
//  Navigation
//
//  Created by Дмитрий on 01.05.2024.
//

import UIKit

// Настройка экрана Login

class LogInViewController: UIViewController {
    override func viewDidLoad() {
        viewSetup()
        addView()
        myConstrainSetup2()
        setupConContentOfScrollView ()
        super.viewDidLoad()
    }
    
    func viewSetup () {
        //        view.backgroundColor = .colorSet
        view.backgroundColor = .white
    }
    
    func addView () {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardObservers ()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers ()
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(
            self
        )
    }
    
    @objc func willShowKeyboard (_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?NSValue)?.cgRectValue.height
        //        scrollView.contentInset.bottom -= keyboardHeight ?? 0.0
        scrollView.contentInset.top -= keyboardHeight ?? 0.0
        print(keyboardHeight ?? 0)
    }
    
    @objc func willHideKeyboard (_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView ()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        //        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    } ()
    
    private lazy var contentView: UIView = {
        let contentView = UIView ()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        //        contentView.backgroundColor = .yellow
        return contentView
    } ()
    
    
    func setupConContentOfScrollView () {
        contentView.addSubview(myLogo)
        contentView.addSubview(myStack)
        contentView.addSubview(logInButton)
        myStack.addSubview(nameTextField)
        myStack.addSubview(myView)
        myStack.addSubview(passTextField)
        
        NSLayoutConstraint.activate([
            
            myLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            myLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            myLogo.heightAnchor.constraint(equalToConstant: 100),
            myLogo.widthAnchor.constraint(equalToConstant: 100),
            
            myStack.topAnchor.constraint(equalTo: myLogo.bottomAnchor, constant: 120),
            myStack.heightAnchor.constraint(equalToConstant: 100),
            myStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            myStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            nameTextField.topAnchor.constraint(equalTo: myStack.topAnchor, constant: 0),
            nameTextField.heightAnchor.constraint(equalToConstant: 49.5),
            nameTextField.leadingAnchor.constraint(equalTo: myStack.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: myStack.trailingAnchor),
            
            myView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 0),
            myView.heightAnchor.constraint(equalToConstant: 0.5),
            myView.leadingAnchor.constraint(equalTo: myStack.leadingAnchor, constant: 16),
            myView.trailingAnchor.constraint(equalTo: myStack.trailingAnchor, constant: -16),
            
            passTextField.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 0),
            passTextField.heightAnchor.constraint(equalToConstant: 49.5),
            passTextField.leadingAnchor.constraint(equalTo: myStack.leadingAnchor, constant: 16),
            passTextField.trailingAnchor.constraint(equalTo: myStack.trailingAnchor, constant: -16),
            
            logInButton.topAnchor.constraint(equalTo: myStack.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 55),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
    
    let myLogo: UIImageView = {
        let logo = UIImageView ()
        logo.image = UIImage(named: "logo")
        logo.clipsToBounds = true
        logo.layer.borderColor = UIColor.lightGray.cgColor
        logo.layer.borderWidth = 0.5
        logo.layer.cornerRadius = 10
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    let myStack: UIStackView = {
        let stack = UIStackView ()
        stack.layer.borderWidth = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 15
        stack.layer.backgroundColor = UIColor.systemGray6.cgColor
        return stack
    }()
    
    let nameTextField: UITextField = {
        let nameText = UITextField ()
        nameText.placeholder = "Email or phone"
        nameText.textColor = .black
        nameText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nameText.keyboardType = UIKeyboardType.default
        nameText.returnKeyType = UIReturnKeyType.done
        nameText.clearButtonMode = UITextField.ViewMode.whileEditing
        nameText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        nameText.translatesAutoresizingMaskIntoConstraints = false
        //        nameText.delegate = self
        return nameText
    }()
    
    let passTextField: UITextField = {
        let passText = UITextField ()
        passText.placeholder = "Password"
        passText.textColor = .black
        passText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passText.isSecureTextEntry = true
        passText.keyboardType = UIKeyboardType.default
        passText.returnKeyType = UIReturnKeyType.done
        passText.clearButtonMode = UITextField.ViewMode.whileEditing
        passText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passText.translatesAutoresizingMaskIntoConstraints = false
        return passText
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton ()
        //        button.setBackgroundImage(UIImage(named: "buttonColor"), for: .normal)
        button.setBackgroundImage(UIImage(named: "buttonColor")?.withAlpha(1.0), for: .normal)
        button.setBackgroundImage(UIImage(named: "buttonColor")?.withAlpha(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "buttonColor")?.withAlpha(0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "buttonColor")?.withAlpha(0.8), for: .disabled)
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func logInButtonAction(sender: UIButton) {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    
    let myView: UIView = {
        var mView = UIView ()
        mView.layer.borderColor = UIColor.lightGray.cgColor
        mView.layer.borderWidth = 0.25
        mView.translatesAutoresizingMaskIntoConstraints = false
        return mView
    }()
    
    func myConstrainSetup2 () {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}

extension UIImage {
    func withAlpha(_ a: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { (_) in
            draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: a)
        }
    }
}

