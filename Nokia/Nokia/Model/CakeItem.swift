//
//  CakeItem.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation
import RealmSwift

class CakeItem: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var ppu: Double = 0.0
    var arrTopings = List<IngredientItem>()
    var arrBatters = List<IngredientItem>()
    
    
    override var description: String{
        return "****CakeItem****\n .id:\t\(id)\n type:\t\(type)\n name:\t\(name)\n arrBatters:\t\(arrBatters)\n arrTopings:\t\(arrTopings)\n****"
    }
    
    init(id:String, type:String, name:String, ppu:Double){
        self.id = id
        self.type = type
        self.name = name
        self.ppu = ppu
    }
    
    convenience init(dic: NSDictionary){
        let id: String = dic["id"] as? String ?? ""
        let type: String = dic["type"] as? String ?? ""
        let name: String = dic["name"] as? String ?? ""
        var ppu: Double = dic["ppu"] as? Double ?? 0.0
        ppu = Double(round(1000*ppu)/1000)
        
        let batters: Dictionary = dic["batters"] as? Dictionary ?? [:]
        let arrTopping: NSArray = dic["topping"] as? NSArray ?? []
        let arrBatters: NSArray = batters["batter"] as? NSArray ?? []
        
        self.init(id:id, type:type, name:name, ppu:ppu)
        
        for item in arrTopping {
            let objIngredient = IngredientItem(dic: item as! NSDictionary)
            objIngredient.type = TypeIngredient.Topping.rawValue
            self.arrTopings.append(objIngredient)
        }
        
        for item in arrBatters {
            let objIngredient = IngredientItem(dic: item as! NSDictionary)
            objIngredient.type = TypeIngredient.Batters.rawValue
            self.arrBatters.append(objIngredient)
        }
        
        
    }
    
    required init() {
        
    }
    
    func exportAsDictionary() -> NSDictionary{
        let id = self.id
        let type = self.type
        let name = self.name
        let ppu = self.ppu
        
        let dict: NSDictionary = ["id":id,"type":type,"name":name, "ppu":ppu]
        
        return dict
    }
    
}
