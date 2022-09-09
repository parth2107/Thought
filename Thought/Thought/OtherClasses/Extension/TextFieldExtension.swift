//
//  TextFieldExtension.swift
//  Thought
//
//  Created by Parth Raval on 2022-08-30.
//

import Foundation
import UIKit

extension UITextField {
    
    func setIcon(icon image: UIImage) {
        
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        leftView = iconContainerView
        leftViewMode = .always
    }
}
