//
//  Extensions.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import UIKit

// MARK: - UIView
extension UIView {
    // Corner Radius
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

// MARK: - String
extension String {
    // Convert String to URL
    var asURL: URL? {
        return URL(string: self)
    }
    
}
