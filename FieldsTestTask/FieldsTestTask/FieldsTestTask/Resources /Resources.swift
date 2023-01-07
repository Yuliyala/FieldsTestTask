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
        case dateBirthday = "Дата рождения"
        case gender = "Пол"
    }
    
    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}
