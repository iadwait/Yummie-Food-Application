//
//  CardView.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import UIKit

/// This class to use card view properties
class CardView: UIView {
    
    // MARK: - Initialize View
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - User Defined Functions
    
    /// Function Call to setup UI
    private func setupUI() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 10
        cornerRadius = 8
    }
    
}
