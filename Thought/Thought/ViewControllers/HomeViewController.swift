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
    
    let thoughtCategories = [
        Category(
            name: "Personal",
            icon: UIImage(named: "defaultUser"),
            bgColor: UIColor.lightGray
        ),
        Category(
            name: "Work",
            icon: UIImage(named: "defaultUser"),
            bgColor: UIColor.lightGray
        )
    ]
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thoughtCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.createCustomView(forCell: thoughtCategories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumInteritemSpacing = 40
        flowLayout.minimumLineSpacing = 35
        
        if collectionView.numberOfItems(inSection: section) == 1 {

                return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: collectionView.frame.width - flowLayout.itemSize.width)

            }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        return CGSize(width: width * 0.25, height: width * 0.25)
    }
}
