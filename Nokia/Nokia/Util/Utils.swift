//
//  Utils.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import Foundation
import UIKit
class Utils{
   
    /// Función para extraer las cadenas en diferentes idiomas
    ///
    /// - Parameter name: cadena sin internacionalizacion
    /// - Returns: cadena asignada al idioma configurado
    class func stringNamed(_ name: String) -> String{
        return NSLocalizedString(name, comment: "-")
    }
    
    class func getColorBranding() -> UIColor{
        return UIColor(red: 0.722, green:0.596, blue:0.400, alpha:1.00)
    }
    
}

