//
//  UIBarButtonItem + Extentions.swift
//  FieldsTestTask
//
//  Created by Yuliya Lapenak on 1/10/23.
//

import UIKit

extension UIBarButtonItem {
    static func createCustomButton(vc: UIViewController, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "chevron.left")?.withRenderingMode(.alwaysTemplate),
                        for: .normal)
        button.setTitle(" Назад", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: -10)
        button.addTarget(vc, action: selector, for: .touchUpInside)
        
        let barItem = UIBarButtonItem(customView: button)
        return barItem
        
    }
}
