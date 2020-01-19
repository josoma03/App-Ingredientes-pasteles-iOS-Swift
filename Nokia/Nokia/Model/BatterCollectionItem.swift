//
//  BatterItem.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation
class BatterCollectionItem: NSObject {
    
    var name: String = ""
    var arrBatter = [BatterItem]()
    
    
    override var description: String{
        return "****BatterCollectionItem****\n name:\t\(name)\n arrBatter:\t\(arrBatter)********"
    }
    
    override init(){
    }
    
    init(name: String, arrBatter: [BatterItem]){
        self.name = name
        self.arrBatter = arrBatter
    }
    
    convenience init(dic: NSDictionary){
        let name: String = dic["name"] as? String ?? ""
        let arrBatter = [BatterItem]()
        
        self.init(name:name, arrBatter:arrBatter)
    }
    
    func exportAsDictionary() -> NSDictionary{
        let name = self.name
        
        let dict: NSDictionary = ["name":name]
        
        return dict
    }
    
}

