//
//  TabBarVC.swift
//  Thought
//
//  Created by Parth Raval on 2022-06-07.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setAllVCs() {
        let icon1 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "Second"), selectedImage: #imageLiteral(resourceName: "SecondSelected"))
        let icon2 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "Third"), selectedImage: #imageLiteral(resourceName: "ThirdSelected"))
        let icon3 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "Fourth"), selectedImage: #imageLiteral(resourceName: "FourthSelected"))
        
        let homeVC = UIStoryboard(name: "Screens", bundle: nil).instantiateViewController(withIdentifier: Identifier.homeVC) as! HomeViewController
        let item1 = UINavigationController(rootViewController: homeVC)
        item1.tabBarItem = icon1
        
        let addVC = UIStoryboard(name: "Screens", bundle: nil).instantiateViewController(withIdentifier: Identifier.homeVC) as! HomeViewController
        let item2 = UINavigationController(rootViewController: addVC)
        item2.tabBarItem = icon2
        
        let settingsVC = UIStoryboard(name: "Screens", bundle: nil).instantiateViewController(withIdentifier: Identifier.settingsVC) as! SettingsViewController
        let item3 = UINavigationController(rootViewController: settingsVC)
        item3.tabBarItem = icon3
        
        let controllers = [item1, item2, item3]
        self.viewControllers = controllers
    }
    
    // MARK: - TabBar Delegate Method
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }

}

// MARK: - Custom TabBar
@IBDesignable class CustomTabBar: UITabBar {
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 15.0
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0.0)
        )
        return path.cgPath
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -3);
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        
        var tabFrame = self.frame
        tabFrame.size.height = 65 + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero)
        tabFrame.origin.y = self.frame.origin.y + (self.frame.height - 65 - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero))
        self.layer.cornerRadius = 20
        self.frame = tabFrame
        
        self.items?.forEach({
            $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0)
        })
        
    }
}
