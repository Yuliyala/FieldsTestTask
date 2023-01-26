//
//  ViewController.swift
//  Custom TextField
//
//  Created by Yuliya Lapenak on 1/26/23.
//

import UIKit

//MARK: - AuthViewController
final  class AuthViewController: UIViewController {

    //MARK: - Private property
    private let registerTextField = RegisterTextField(placeholder: "Enter your password")
    
    //MARK: - Overrade Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
 
//MARK: - Setting View

private extension AuthViewController {
    func setupView() {
        view.backgroundColor = .systemCyan
        addSubview()
        
        setupLayout()
    }
}

//MARK: - Setting

private extension AuthViewController {
    func addSubview() {
        view.addSubview(registerTextField)
    }
}

//MARK: - Layout

private extension AuthViewController {
    func setupLayout() {
        registerTextField.translatesAutoresizingMaskIntoConstraints = false
        
        registerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        registerTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
}
