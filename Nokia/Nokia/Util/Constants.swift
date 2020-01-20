//
//  Constants.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation

struct Constants {
    static let PathCake = "5ddbebf23400008e4feadfcc"
    static let ApiURL = "http://www.mocky.io/v2/{path}"
    static let cellIdentifier = "ReusableCell"
    static let cellCakeDetail = "CakeDetailCell"
    static let cellIngredient = "IngredientCell"
}

enum TypeIngredient: String{
    case Batters = "batters"
    case Topping = "topping"
}
