//
//  UIView + Extensions.swift
//  FieldsTestTask
//
//  Created by Yuliya Lapenak on 1/5/23.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
