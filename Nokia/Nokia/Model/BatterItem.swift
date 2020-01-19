//
//  BatterItem.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation

class BatterItem: NSObject {
    
    var id: String = ""
    var type: String = ""
    var selected: Bool = false
    
    override var description: String{
        return "****BatterItem****\n id:\t\(id)\ntype:\t\(type)\nselected:\t\(selected)\n********"
    }
    
    override init(){
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
    
    func exportAsDictionary() -> NSDictionary{
        let id = self.id
        let type = self.type
        
        let dict: NSDictionary = ["id":id,"type":type]
        
        return dict
    }
    
}

