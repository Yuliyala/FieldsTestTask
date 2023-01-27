//
//  EyeButton.swift
//  Custom TextField
//
//  Created by Yuliya Lapenak on 1/26/23.
//

import UIKit

final class EyeButton: UIButton {
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   //MARK: - Private Methods
    private func setupEyeButton() {
           //изначально будет картинка зачеркнутого глаза
        setImage(UIImage(systemName: "eye.slash"), for: .normal)
        tintColor = .white
        //задаем ширину 40 поинт используя констрейнты
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        isEnabled = false
    }
}
