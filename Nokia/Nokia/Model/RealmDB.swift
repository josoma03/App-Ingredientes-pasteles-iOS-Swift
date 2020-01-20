//
//  Realm.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 19/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDB{
    let realm : Realm
    
    
    private static var sharedRealmDB: RealmDB = {
        let realmDB = RealmDB()
        return realmDB
    }()
    
    class func shared() -> RealmDB {
        return sharedRealmDB
    }

    
    private init() {
        realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    func deleteAll(){
        do{
            try realm.write {
                realm.deleteAll()
            }
        }catch{
            print("Error deleting \(error)")
        }
    }
    
    func saveIngredient(_ objIngredient: IngredientItem){
        do{
            try realm.write {
                realm.add(objIngredient)
            }
        }catch{
            print("Error saving \(error)")
        }
    }
    
    func getIngredientsDeletedByType(_ type: String) -> Results<IngredientItem>{
        if type == TypeIngredient.Batters.rawValue{
            return realm.objects(IngredientItem.self).filter("typeIngredient = %@ AND parentCattersCake.arrBatters.@count = 0", type).sorted(byKeyPath: "type")
        }else{
            return realm.objects(IngredientItem.self).filter("typeIngredient = %@ AND parentToppingsCake.arrTopings.@count = 0", type).sorted(byKeyPath: "type")
        }
        
    }
    
    
    func getIngredientsSelectedByType(_ type: String) -> Results<IngredientItem>{
        return realm.objects(IngredientItem.self).filter("typeIngredient = %@ and selected=1", type).sorted(byKeyPath: "type")
    }
    
    func getIngredientsByTypeAndName(_ type: String, _ name: String) -> Results<IngredientItem>{
        return realm.objects(IngredientItem.self).filter("typeIngredient = %@ AND type CONTAINS[cd] %@", type, name).sorted(byKeyPath: "type")
    }
    
    func getFirstCake() -> CakeItem{
        return realm.objects(CakeItem.self).first ?? CakeItem()
    }
    
    
    func saveCake(_ objCake: CakeItem){
        do{
            try realm.write {
                realm.add(objCake)
            }
        }catch{
            print("Error saving \(error)")
        }
    }
    
    func getCake() -> Results<CakeItem>{
        return realm.objects(CakeItem.self)
    }
}
