//
//  Resourses.swift
//  FieldsTestTask
//
//  Created by Yuliya Lapenak on 1/5/23.
//

import UIKit


enum  Resources {
    
    enum NameFields: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчество"
        case birthday = "Дата рождения"
        case gender = "Пол"
    }
    
    enum Gender: String, CaseIterable {
        case noSpecified = "Не указано"
        case man = "Мужской"
        case woman = "Женский"
    }
    
    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}
