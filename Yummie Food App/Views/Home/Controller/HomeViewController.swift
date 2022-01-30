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
    @IBOutlet weak var collectionViewPopularDishes: UICollectionView!
    
    // MARK: - Variable Declarations
    var arrCategory: [DishCategory] = [
        DishCategory(id: "Id1", name: "Indian Dish 1", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 2", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 3", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 4", image: "https://picsum.photos/100/200"),
        DishCategory(id: "Id1", name: "Indian Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var arrDishes: [Dish] = [
        Dish(id: "Id1", name: "Peppy Panner Pizza", image: "https://picsum.photos/100/200", description: "The Dish is rated 5 Stars by Customers.Give it a Try !!", calorie: 120),
        Dish(id: "Id1", name: "Peppy Panner Pizza", image: "https://picsum.photos/100/200", description: "The Dish is rated 5 Stars by Customers.Give it a Try !!", calorie: 120),
        Dish(id: "Id1", name: "Peppy Panner Pizza", image: "https://picsum.photos/100/200", description: "The Dish is rated 5 Stars by Customers.Give it a Try !!", calorie: 120),
        Dish(id: "Id1", name: "Peppy Panner Pizza", image: "https://picsum.photos/100/200", description: "The Dish is rated 5 Stars by Customers.Give it a Try !!", calorie: 120),
        Dish(id: "Id1", name: "Peppy Panner Pizza", image: "https://picsum.photos/100/200", description: "The Dish is rated 5 Stars by Customers.Give it a Try !!", calorie: 120),
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
        
        // Register Xib
        collectionViewPopularDishes.register(UINib(nibName: DishesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishesCollectionViewCell.identifier)
        // Set Delegate, DataSource
        collectionViewPopularDishes.delegate = self
        collectionViewPopularDishes.dataSource = self
        // Setup UI
        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .horizontal
        collectionViewPopularDishes.collectionViewLayout = layout1
        collectionViewPopularDishes.showsHorizontalScrollIndicator = false
        // Content Padding
        collectionViewPopularDishes.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    // MARK: - IBActions

}

// MARK: - Extensions

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewCategory {
            return arrCategory.count
        } else if collectionView == collectionViewPopularDishes {
            return arrDishes.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Category Collection View
        if collectionView == collectionViewCategory {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            let data = arrCategory[indexPath.row]
            cell.setupUI(categoryData: data)
            return cell
        }
        // Popular Dishes Collection View
        else if collectionView == collectionViewPopularDishes {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesCollectionViewCell.identifier, for: indexPath) as! DishesCollectionViewCell
            let data = arrDishes[indexPath.row]
            cell.setupUI(dishData: data)
            return cell
        }
        // Chef's Special Collection View
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewCategory {
            return CGSize(width: 200, height: 55)
        } else {
            return CGSize(width: 240, height: 369)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collectionViewCategory {
            return 10
        } else {
            return 0
        }
    }
    
}


