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
    private let eyeButton = EyeButton()
    //создаем дополнительное логическое свойство от которого будет зависеть картинка
    private var isPrivate = true
    
    //MARK: - Overrade Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    //MARK: - Actions
    @objc
    private func displayBookMarks() {
        let imageName = isPrivate ? "eye" : "eye.slash"
        //далее меняем свойство isSecure на противоположное
        registerTextField.isSecureTextEntry.toggle()
        //задаем картинку для кнопки
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        isPrivate.toggle()
    }
}

//MARK: - Setting View
private extension AuthViewController {
    func setupView() {
        view.backgroundColor = .systemCyan
        addSubview()
        addActions()
        
        setupPasswordTF()
        
        setupLayout()
    }
}

//MARK: - Setting

private extension AuthViewController {
    func addSubview() {
        view.addSubview(registerTextField)
    
    }
    
    func addActions() {
        //делаем экшн для кнопки . У каждого элемента интерфейса с которым взаимодействует пользователь есть метод который называется addTarget. Первым параметром определяем того, кто будет вызывать этот метод. Это наш класс AuthViewController.Второй параметр отвечает за сам метод который должен сработать мы его должны прописать через селектор и создать сам метод. третий параметр event это то событие при котором будет срабатывать метод в параметре Action , в нашем случае это нажатие на кнопку
        eyeButton.addTarget(self, action: #selector(displayBookMarks), for: .touchUpInside)
    }
    
    func setupPasswordTF() {
        registerTextField.delegate = self
        // определяемся с какой стороны кнопка
        registerTextField.rightView = eyeButton
        //чтобы кнопка появилась нужно определить в какой момент за это отвечает свойство  rightViewMode и отображать его будем всегда
        registerTextField.rightViewMode = .always
       
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

// как сделать кнопку активной в момент внесения инфо в текстовое поле.Для этого используется метод протокола UITextFieldDelegate кот наз textFieldDidChangeSelection  этот метод срабатывает всегда когда пользователь вносит какое -либо изменение в текстовое поле
extension AuthViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        eyeButton.isEnabled = !text.isEmpty
    }
}
