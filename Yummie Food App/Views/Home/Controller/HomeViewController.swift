//
//  HomeViewController.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import UIKit

/// This Class is for Home View Controller
class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    
    // MARK: - Variable Declarations
    var arrCategory: [DishCategory] = [
        DishCategory(id: "Id1", name: "Indian Dish 1", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 2", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 3", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 4", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    // MARK: - View's Initialization Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureCollectionView()
    }
    
    // MARK: - User Defined Functions
    
    /// Function to setup Screen UI
    func setupUI() {
        title = "Yummie"
    }
    
    /// Function to Configure Collection View
    func configureCollectionView() {
        // Register Xib
        collectionViewCategory.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        // Set Delegate, DataSource
        collectionViewCategory.delegate = self
        collectionViewCategory.dataSource = self
        // Setup UI
        collectionViewCategory.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionViewCategory.collectionViewLayout = layout
        // Content Padding
        collectionViewCategory.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    // MARK: - IBActions

}

// MARK: - Extensions

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        let data = arrCategory[indexPath.row]
        cell.setupUI(categoryData: data)
        if indexPath.row == 0 {
//            cell.viewBG.backgroundColor = .red
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}


