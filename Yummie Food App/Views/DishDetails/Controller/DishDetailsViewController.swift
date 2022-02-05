//
//  DishDetailsViewController.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 05/02/22.
//

import UIKit

/// This class is Controller for Dish Details View
class DishDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var imgViewDish: UIImageView!
    @IBOutlet weak var lblDishName: UILabel!
    @IBOutlet weak var lblCalorie: UILabel!
    @IBOutlet weak var txtViewDishDesc: UITextView!
    @IBOutlet weak var tflName: UITextField!
    
    // MARK: - Variable Declarations
    
    // MARK: - View's Initialization Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - User Defined Functions
    
    /// Function call to setup Screen UI
    func setupUI(){
        txtViewDishDesc.isUserInteractionEnabled = false
        txtViewDishDesc.showsVerticalScrollIndicator = false
        txtViewDishDesc.text = "Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description. Some Description."
    }
    
    // MARK: - IBActions
    
    /// Function call when user Taps on Place Order
    /// - Parameter sender: UIButton
    @IBAction func btnPlaceOrderTapped(_ sender: UIButton) {
        
    }
}
