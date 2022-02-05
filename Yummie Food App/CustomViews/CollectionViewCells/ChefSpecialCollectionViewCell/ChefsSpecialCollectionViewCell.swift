//
//  ChefsSpecialCollectionViewCell.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 05/02/22.
//

import UIKit

/// This class is for Chef's Special Dishes Cell
class ChefsSpecialCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var viewCardView: CardView!
    @IBOutlet weak var imgViewDish: UIImageView!
    @IBOutlet weak var lblDishName: UILabel!
    @IBOutlet weak var lblDishDescription: UILabel!
    @IBOutlet weak var lblCalorie: UILabel!
    
    // MARK: - Variable Declarations
    static let identifier = "ChefsSpecialCollectionViewCell"
    
    // MARK: - View's Initialization Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - User Defined Functions
    
    /// Function Call to Setup UI
    /// - Parameter dishData: Dish Data
    func setupUI(dishData: Dish) {
        self.lblDishName.text = dishData.name
        self.imgViewDish.kf.setImage(with: dishData.image.asURL)
        self.lblCalorie.text = "Calories: \(String(dishData.formattedCalorie))"
        self.lblDishDescription.text = dishData.description
        imgViewDish.contentMode = .scaleToFill
    }
    
    // MARK: - IBActions

}
