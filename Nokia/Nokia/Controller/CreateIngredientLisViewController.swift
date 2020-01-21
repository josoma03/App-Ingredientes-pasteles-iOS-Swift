//
//  NewIngredientLisViewController.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 20/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import UIKit
import Foundation


class CreateIngredientLisViewController: UIViewController{
    var delegate : AddIngredientsDelegate?
    var objIngredient : IngredientItem?
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var txtType: UITextField!
    var arrType : NSMutableArray!
    let pickerType: UIPickerView = UIPickerView()   /// Selector del tipo de usuario para autenticación.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblType.text = Utils.stringNamed("Type")
        self.lblId.text = Utils.stringNamed("Id")
        self.lblName.text = Utils.stringNamed("Name")
        self.pickerType.delegate = self
        self.pickerType.dataSource = self
        self.pickerType.backgroundColor = UIColor.white
        let frame: CGRect = CGRect(x: 0, y: 0, width: self.pickerType.frame.width, height: self.pickerType.frame.height)
        self.pickerType.frame = frame
        self.txtType.inputView = self.pickerType
        arrType = [Utils.stringNamed("Batters"), Utils.stringNamed("Topping")]
    }
    
    func setValuesByIngredient(){
        self.txtId.text = self.objIngredient?.id
        self.txtName.text = self.objIngredient?.type
        self.txtType.text = self.objIngredient?.typeIngredient
        
    }
    
    func validateFields() -> Bool{
        view.endEditing(true)
        var bValid:Bool = (self.lblId.text != "")
        bValid = bValid && (self.lblName.text != "")
        bValid = bValid && (self.txtType.text != "")
        
        if !bValid {
            self.showToast(message: Utils.stringNamed("All_fields_are_required"))
        }else{
            self.objIngredient?.id = txtId.text!
            self.objIngredient?.type = txtName.text!
            self.objIngredient?.typeIngredient = txtType.text!
        }
        return bValid
    }
    
    
   
    //MARK - Add New Ingredients
    
    @IBAction func createIngredientPressed(_ sender: Any) {
        if validateFields() {
            self.navigationController?.popViewController(animated: true)
            delegate?.addIngredient(objIngredient)
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
        return (self.arrType![row] as! String)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtType.text = (self.arrType![row] as! String)
        self.txtType.resignFirstResponder()
    }
    
}
