//
//  OnboardingCollectionViewCell.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import UIKit

/// Onboarding Collection View Cell
class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgViewSlide: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    // MARK: - Variable Declarations
    static let identifier = "OnboardingCollectionViewCell"
    
    // MARK: - User Defined Functions
    
    /// Function call to setup Slide Data
    /// - Parameter data: Data
    func setup(data: OnboardingSlide) {
        self.imgViewSlide.image = data.image
        self.lblTitle.text = data.title
        self.lblDescription.text = data.description
    }
    
}
