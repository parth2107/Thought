//
//  CustomView.swift
//  Thought
//
//  Created by Parth Raval on 2022-09-09.
//

import Foundation
import UIKit

@IBDesignable class CustomView: UIView {
    @IBInspectable var radii: CGFloat = 15.0
    
    private var shapeLayer: CGLayer?
    
    override func draw(_ rect: CGRect) {
        addShape(toView: self, withOffset: 0.4)
    }
    
    private func addShape(toView imageView: UIView, withOffset offset: CGFloat) {
        
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topRight, .topLeft, .bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: radii, height: 0.0)
        )
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.black.cgColor
        imageView.layer.mask = shapeLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        addShape(toView: self, withOffset: 0.4)
    }
}
