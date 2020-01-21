//
//  CommonItem.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 19/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation
import RealmSwift

class IngredientItem: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var selected: Bool = false
    @objc dynamic var type:String = ""
    var parentCattersCake = LinkingObjects(fromType: CakeItem.self, property: "arrBatters")
    var parentToppingsCake = LinkingObjects(fromType: CakeItem.self, property: "arrTopings")

    
    override var description: String{
        return "****IngredientItem****\n id:\t\(id)\n type:\t\(name)\n selected:\t\(selected)n typeIngredient:\t\(type)\n********"
    }
    
    init(id: String,name: String, type: String){
        self.id = id
        self.name = name
        self.type = type
    }
    init(id: String,name: String){
        self.id = id
        self.name = name
    }
    
    convenience init(dic: NSDictionary){
        let id: String = dic["id"] as? String ?? ""
        let name: String = dic["type"] as? String ?? ""
        
        self.init(id:id,name:name)
    }
    
    required init() {
        
    }
}
