//
//  Category.swift
//  Thought
//
//  Created by Parth Raval on 2022-09-15.
//

import Foundation
import UIKit

class Category {
    let categoryName:String?
    let categoryIcon:UIImage?
    let categoryBgColor:UIColor?
    
    init(name: String?, icon: UIImage?, bgColor: UIColor?) {
        self.categoryName = name
        self.categoryIcon = icon
        self.categoryBgColor = bgColor
    }
}
