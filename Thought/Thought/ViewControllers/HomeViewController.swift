//
//  HomeViewController.swift
//  Thought
//
//  Created by Parth Raval on 2022-05-06.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var textFieldSearch: UITextField! {
        didSet {
            textFieldSearch.tintColor = UIColor.lightGray
            textFieldSearch.setIcon(icon: UIImage(named: "search")!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
