//
//  CategoryCollectionViewCell.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import UIKit
import Kingfisher

/// Reusable Cell for Category View
class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    // MARK: - Variable Declarations
    static let identifier = "CategoryCollectionViewCell"
    
    // MARK: - View's Initialization Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - User Defined Functions
    
    func setupUI(categoryData: DishCategory) {
        self.lblTitle.text = categoryData.name
        self.imgView.kf.setImage(with: categoryData.image.asURL)
    }
    
    // MARK: - IBActions

}
