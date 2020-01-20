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
    @objc dynamic var type: String = ""
    @objc dynamic var selected: Bool = false
    @objc dynamic var typeIngredient:String = ""
    var parentCattersCake = LinkingObjects(fromType: CakeItem.self, property: "arrBatters")
    var parentToppingsCake = LinkingObjects(fromType: CakeItem.self, property: "arrTopings")

    
    override var description: String{
        return "****IngredientItem****\n id:\t\(id)\n type:\t\(type)\n selected:\t\(selected)n typeIngredient:\t\(typeIngredient)\n********"
    }
    
    init(id: String,type: String, typeIngredient: String){
        self.id = id
        self.type = type
        self.typeIngredient = typeIngredient
    }
    init(id: String,type: String){
        self.id = id
        self.type = type
    }
    
    convenience init(dic: NSDictionary){
        let id: String = dic["id"] as? String ?? ""
        let type: String = dic["type"] as? String ?? ""
        
        self.init(id:id,type:type)
    }
    
    required init() {
        
    }
    
    func exportAsDictionary() -> NSDictionary{
        let id = self.id
        let type = self.type
        
        let dict: NSDictionary = ["id":id,"type":type]
        
        return dict
    }
    
    func getFullName() -> String {
        return "Id: \(self.id) - Type: \(self.type)"
    }
    
}
