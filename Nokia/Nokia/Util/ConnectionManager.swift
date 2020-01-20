//
//  ConnectionManager.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 19/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation

class ConnectionManager: NSObject {
    
    // MARK: WS
    
    
    /// Permite obtener un listado de Cakes, para el ejemplo solo tiene un elemento
    ///
    /// - Parameters:
    ///   - onCompleted: Bloque que se ejecuta el terminar la peticion
    func getCakes(idCategory:Int, onCompleted: @escaping (_ succeeded: Bool, _ msg: String, _ data: [CakeItem]) -> ()) {
        
        let urlString = Constants.ApiURL.replacingOccurrences(of: "{path}", with: Constants.PathCake)
        let httpMethod:HTTPMethod = .Get
        
        NetworkManager.sharedInstance.exec(httpMethod: httpMethod, urlString: urlString, headers: nil, parameters: nil, values: nil, body: nil, isJSON: true) { (success, msg, data) in
            var arrCake = [CakeItem]()
            let results: NSArray = data as? NSArray ?? []
            
            for element in results{
                let objCake = CakeItem(dic: element as! NSDictionary)
                arrCake.append(objCake)
            }
            onCompleted(success, msg, arrCake)
        }
    }
    
    
    // MARK: Shared Instance
    static let sharedInstance = ConnectionManager()
}
