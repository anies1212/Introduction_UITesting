//
//  ViewController.swift
//  AccountUITesting
//
//  Created by 新垣 清奈 on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {
    private let logInLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()

    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "username"
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.autocorrectionType = .no
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        return textField
    }()
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(UIColor.label, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logInLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        logInButton.addTarget(self, action: #selector(tappedLogInButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logInLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        usernameTextField.frame = CGRect(x: 30, y: 150, width: view.frame.width-60, height: 50)
        passwordTextField.frame = CGRect(x: 30, y: 200, width: view.frame.width-60, height: 50)
        logInButton.frame = CGRect(x: (view.frame.width/2)-150, y: 300, width: view.frame.width-100, height: 50)
    }

    @objc private func tappedLogInButton(){
        if passwordTextField.text == "Password", usernameTextField.text == "UserName" {
            let vc = SecondViewController.instantiate()
            present(vc, animated: true)
            return
        }
        alert()
    }
    private func alert(){
        let alert = UIAlertController(title: "Wrong!!", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

