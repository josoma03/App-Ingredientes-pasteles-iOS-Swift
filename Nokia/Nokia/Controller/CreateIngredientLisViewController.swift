//
//  NewIngredientLisViewController.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 20/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import UIKit
import Foundation

protocol IngredientsDelegate{
    func addIngredient(_ objIngredientItem: IngredientItem)
    func editIngredient(_ objIngredientItem: IngredientItem)
}


class CreateIngredientLisViewController: UIViewController{
    var delegate : IngredientsDelegate?
    var objIngredient : IngredientItem?
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var txtType: UITextField!
    var arrType = [TypeStruct]()
    let pickerType: UIPickerView = UIPickerView()   /// Selector del tipo de usuario para autenticación.
    var isEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
        
        self.lblType.text = Utils.stringNamed("Type")
        self.lblId.text = Utils.stringNamed("Id")
        self.lblName.text = Utils.stringNamed("Name")
        self.pickerType.delegate = self
        self.pickerType.dataSource = self
        self.pickerType.backgroundColor = UIColor.white
        let frame: CGRect = CGRect(x: 0, y: 0, width: self.pickerType.frame.width, height: self.pickerType.frame.height)
        self.pickerType.frame = frame
        self.txtType.inputView = self.pickerType
        
        self.arrType = [
            TypeStruct(id: TypeIngredient.Batters.rawValue, name: Utils.stringNamed("Batters")),
            TypeStruct(id: TypeIngredient.Topping.rawValue, name: Utils.stringNamed("Topping"))
        ]
        
        
        if self.isEdit{
            self.title = Utils.stringNamed("Edit_ingredient")
        }else{
            self.title = Utils.stringNamed("New_ingredient")
        }
    }
    
    
    /// Permite asignar los valores del ingrediente en los controles
    func setValues(){
        self.txtId.text = self.objIngredient?.id
        self.txtName.text = self.objIngredient?.name
        self.txtType.text = Utils.stringNamed((self.objIngredient?.type)!)
        self.isEdit = (self.objIngredient?.id != "")
        
    }
    
    /// Permite validar que todos los campos esten diligenciados
    ///
    /// - Returns: indica si todo esta diligenciado
    func validateFields() -> Bool{
        view.endEditing(true)
        var bValid:Bool = (self.lblId.text != "")
        bValid = bValid && (self.lblName.text != "")
        bValid = bValid && (self.txtType.text != "")
        
        if !bValid {
            self.showToast(message: Utils.stringNamed("All_fields_are_required"))
        }else{
            try! RealmDB.shared().realm.write {
                self.objIngredient?.id = txtId.text!
                self.objIngredient?.name = txtName.text!
            }
        }
        return bValid
    }
    
    
   
    //MARK - Add New Ingredients
    
    
    /// Valida que los campos esten diligenciados e invoca al delegado
    /// solicitando actualizar la lista
    ///
    /// - Parameter sender: 
    @IBAction func createIngredientPressed(_ sender: Any) {
        if validateFields() {
            self.navigationController?.popViewController(animated: true)
            if self.isEdit{
                delegate?.editIngredient(objIngredient!)
            }else{
                delegate?.addIngredient(objIngredient!)
            }
        }
    }
   
}

extension CreateIngredientLisViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrType[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtType.text = self.arrType[row].name
        self.txtType.resignFirstResponder()
        try! RealmDB.shared().realm.write {
            self.objIngredient?.type = self.arrType[row].id
        }
    }
    
}


struct TypeStruct {
    var id: String
    var name: String
}
