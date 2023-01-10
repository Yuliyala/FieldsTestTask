//
//  UIViewController + Extensions.swift
//  FieldsTestTask
//
//  Created by Yuliya Lapenak on 1/10/23.
//

import UIKit

extension UIViewController {
    
    func presentSimpleAlert(title: String, message: String?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
