//
//  DishesCollectionViewCell.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import UIKit
import Kingfisher


/// Reusable Cell for Dishes View
class DishesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblCalories: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    // MARK: - Variable Declarations
    static let identifier = "DishesCollectionViewCell"
    
    // MARK: - View's Initialization Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - User Defined Functions
    
    /// Function Call to Setup UI
    /// - Parameter dishData: Dish Data
    func setupUI(dishData: Dish) {
        self.lblTitle.text = dishData.name
        self.imgView.kf.setImage(with: dishData.image.asURL)
        self.lblCalories.text = "Calories: \(String(dishData.formattedCalorie))"
        self.lblDescription.text = dishData.description
        imgView.contentMode = .scaleToFill
    }
    
    // MARK: - IBActions
    
}
