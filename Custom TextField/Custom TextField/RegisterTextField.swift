//
//  RegisterTextField.swift
//  Custom TextField
//
//  Created by Yuliya Lapenak on 1/26/23.
//

import UIKit

//MARK: - RegisterTextField
final class RegisterTextField: UITextField {
    
    //MARK: - Private property
    // инициализируем структуру <#T##UIEdgeInsets#>
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
@available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Override Methods
    //метод textRect отвечает за размещение текстового поля внесенного пользователем и параметр bounds по сути прямоугольник для текстового поля и мы зададим для него новые размеры при помощи метода inset - этот метод отвечает за внесенный текст пользователем
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    //метод отвечает за размещение плейсхолдера
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    //метод отвечает за размещение уже отредактированного текста
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    
    //MARK: - Private Methods
    
    private func setupTextField(placeholder: String) {
        textColor = .white
        
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    //тень
        layer.shadowColor = UIColor.black.cgColor //цвет
        layer.shadowRadius = 7 // радиус
        layer.shadowOpacity = 0.4 // насыщенность
        layer.shadowOffset = CGSize(width: 15, height: 15)//смещение на 15 поинтов
        
        //настройка placeholder
        //инициализируем в свойстве attributedPlaceholder класс  NSAttributedString , в параметре стринг определяем текст плэйсхолдера,
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan])
        font = .boldSystemFont(ofSize: 18)
        //изначально текстовое поле будет отображать текст
        isSecureTextEntry = true
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
}
