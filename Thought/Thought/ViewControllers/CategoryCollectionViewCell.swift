//
//  CategoryCollectionViewCell.swift
//  Thought
//
//  Created by Parth Raval on 2022-09-09.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var customViewCategory: CustomView!
    @IBOutlet weak var lblCategory: UILabel!
    
    func createCustomView(forCell category: Category) {
        customViewCategory.backgroundColor = category.categoryBgColor
        lblCategory.text = category.categoryName
    }
}
