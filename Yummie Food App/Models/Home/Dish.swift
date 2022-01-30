//
//  Dish.swift
//  Yummie Food App
//
//  Created by Adwait Barkale on 30/01/22.
//

import Foundation

/// Model to hold data for Dish cell
struct Dish {
    
    let id,name,image,description : String
    let calorie: Double?
    var formattedCalorie: String {
        return String(format: "%.2f", calorie ?? 0)
    }
    
}
