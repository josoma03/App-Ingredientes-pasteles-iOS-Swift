//
//  CakeItem.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation
class CakeItem: NSObject {
    
    var id: String = ""
    var type: String = ""
    var name: String = ""
    var ppu: String = ""
    
    override var description: String{
        return "****CakeItem****\n .id:\t\(id)\ntype:\t\(type)\nname:\t\(name)\n****"
    }
    
    override init(){
    }
    
    init(id:String, type:String, name:String, ppu:String){
        self.id = id
        self.type = type
        self.name = name
        self.ppu = ppu
    }
    
    convenience init(dic: NSDictionary){
        let id: String = dic["id"] as? String ?? ""
        let type: String = dic["type"] as? String ?? ""
        let name: String = dic["name"] as? String ?? ""
        let ppu: String = dic["ppu"] as? String ?? ""
        
        self.init(id:id, type:type, name:name, ppu:ppu)
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
