//
//  ViewController.swift
//  Nokia
//  Permite gestionar la lista de los ingredientes para preparar el pastel.
//
// Se podrá agregar editar y eliminar cualquier item de la lista.
// Se podrá check en cualquier item de la lista
// los ingredientes deberán guardarse en una base de datos local.
// una vez ceckeados los  todos los items de la lista, mostrara un mensaje sencillo
// indicando que la preparación finalizó.
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.

import UIKit
import RealmSwift

class CakeListViewController: UITableViewController {
    var objCake : CakeItem!
    var optionSelected : TypeIngredient?
    var indicator = UIActivityIndicatorView()
    var objIngredientSelected : IngredientItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Utils.stringNamed("cook_the_cake")
        self.loadData();
        self.navigationController?.navigationBar.tintColor = Utils.getColorBranding()
        
        tableView.register(UINib(nibName: Constants.cellIngredient, bundle: nil), forCellReuseIdentifier: Constants.cellIngredient)
        tableView.register(UINib(nibName: Constants.cellCakeDetail, bundle: nil), forCellReuseIdentifier: Constants.cellCakeDetail)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorStyle = .singleLine
        
    }

    
    //MARK - Add New Ingredients
    
    /// Permite desplegar las opciones de ingredientes a añadir: Batters, Toppings
    ///
    /// - Parameter sender:
    @IBAction func addIngredientPressed(_ sender: Any) {
        self.objIngredientSelected = IngredientItem()
        self.performSegue(withIdentifier: "gotoCreateIngredient", sender: self)
    }
    
    //MARK: - Other methods
    
    
    /// Permite guardar en base de datos el resultado obtenido en el WS
    ///
    /// - Parameter data: arreglo obtenido del WS
    func saveCakesBD(_ data: [CakeItem]){
        for objCake in data{
            RealmDB.shared().saveCake(objCake)
        }
    }
    /// Permite buscar la receta con sus ingredientes en base de datos
    func loadData(){
        ConnectionManager.sharedInstance.getCakes(idCategory: 1) { (result, msg, data) in
            DispatchQueue.main.async {
                self.saveCakesBD(data)
                
                self.objCake = RealmDB.shared().getFirstCake()
                self.tableView.reloadData()
            }
        }
    }
    
    
    /// Permite eliminar un ingrediente de las listas: Batter, Topping
    ///
    /// - Parameter indexPath: indexPath de la seccion
    func deleteIngredient(_ indexPath: IndexPath){
        try! RealmDB.shared().realm.write {
            if(indexPath.section == 1){
                self.objCake.arrBatters[indexPath.row].selected = false
                self.objCake.arrBatters.remove(at: indexPath.row)
            }else{
                self.objCake.arrTopings[indexPath.row].selected = false
                self.objCake.arrTopings.remove(at: indexPath.row)
            }
        }
        self.validateCheckedAll()
        self.tableView.reloadData()
    }
    
    /// Permite obtener el listado de los ingredientes dependiendo del tipo: Batter, Topping
    ///
    /// - Parameter section: numero de la seccion: 1, 2
    /// - Returns: [IngredientItem]
    func getIngredientsBySection(_ section: Int) -> List<IngredientItem> {
        if(objCake != nil){
            return (section == 1) ? objCake!.arrBatters : objCake.arrTopings
        }else{
            return List<IngredientItem>()
        }
    }
    
    /// Permite obtener un ingrediente dependiendo de la seccion: Batter, Topping
    ///
    /// - Parameter indexPath: indexPath de la seccion
    /// - Returns: IngredientItem
    func getIngredient(_ indexPath: IndexPath) -> IngredientItem {
        let arrIngredients = getIngredientsBySection(indexPath.section)
        return (arrIngredients.count > 0) ? arrIngredients[indexPath.row] : IngredientItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "gotoCreateIngredient"){
            let controller = segue.destination  as! CreateIngredientLisViewController
            controller.delegate = self
            controller.objIngredient = objIngredientSelected
        }
        
    }
    
    
    /// una vez ceckeados los  todos los items de la lista, mostrara un mensaje sencillo indicando que la preparación finalizó.
    func validateCheckedAll(){
        var bValid = true
        for item in self.objCake.arrTopings{
            bValid = bValid && item.selected
        }
        for item in self.objCake.arrBatters{
            bValid = bValid && item.selected
        }
        
        if bValid{
            self.showToast(message: Utils.stringNamed("The_preparation_is_finished"))
        }
    }
    
    //MARK - Tableview Datasource Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title : String = ""
        switch(section){
        case 0:
            title = Utils.stringNamed("Cake")
            break
        case 1:
            title = Utils.stringNamed("Batters")
            break
        case 2:
            title = Utils.stringNamed("Topping")
            break
        default: break
            
        }
        return title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return getIngredientsBySection(section).count
        }
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){ //Celda del detalle del pastel
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellCakeDetail) as! CakeDetailCell
            if self.objCake != nil{
                cell.setValuesByIngredient(self.objCake)
            }
            return cell
        }else{                      //Celdas de las secciones Batters y Toppings
            let objIngredient = getIngredient(indexPath)
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIngredient) as! IngredientCell
            cell.setValuesByIngredient(objIngredient)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0){
            return 0
        }
        else {
            return 40
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if(indexPath.section == 0){
            return 320
        }else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor(red: 0.980, green:0.980, blue:0.980, alpha:1.00)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Utils.getColorBranding()
        
        //Añadir un borde en parte inferior de cada nombre de la seccion
        let border = CALayer()
        border.backgroundColor = Utils.getColorBranding().cgColor
        border.frame = CGRect(x: 0, y: view.frame.size.height - 1, width: view.frame.size.width, height: 1)
        view.layer.addSublayer(border)
    }
    

    
    //MARK - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Coloca o  quita la marca de seleccionado en cada objeto
        let objIngredient = getIngredient(indexPath)
        try! RealmDB.shared().realm.write {
            objIngredient.selected = !objIngredient.selected
        }
        self.validateCheckedAll()
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return (indexPath.section != 0)
    }
    

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editButton = UITableViewRowAction(style: .normal, title: Utils.stringNamed("Edit")) { (rowAction, indexPath) in
            self.objIngredientSelected = self.getIngredient(indexPath)
            self.performSegue(withIdentifier: "gotoCreateIngredient", sender: self)
        }
        editButton.backgroundColor = Utils.getColorBranding()
        let deleteButton = UITableViewRowAction(style: .normal, title: Utils.stringNamed("Delete")) { (rowAction, indexPath) in
            //Dialogo de confirmacion para eliminar una fila
            let alert = UIAlertController(title: Utils.stringNamed("delete_confirmation"), message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: Utils.stringNamed("Cancel"), style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: Utils.stringNamed("Accept"), style: .default, handler: { (alert) in
                self.deleteIngredient(indexPath)
            }))
            alert.view.tintColor = Utils.getColorBranding()
            self.present(alert, animated: true, completion: nil)
        }
        deleteButton.backgroundColor = UIColor.red
        
        return [editButton, deleteButton]
    }
    
}

//MARK: - Delegate IngredientsDelegate methods
extension CakeListViewController: IngredientsDelegate{
    
    
    /// Agrega el nuevo elemento a la lista correspondiente: Batter, Topping
    ///
    /// - Parameter objIngredientItem: nuevo ingrediente
    func addIngredient(_ objIngredientItem: IngredientItem) {
        try! RealmDB.shared().realm.write {
            if objIngredientItem.type == TypeIngredient.Batters.rawValue {
                self.objCake.arrBatters.append(objIngredientItem)
            } else {
                self.objCake.arrTopings.append(objIngredientItem)
            }
        }
        tableView.reloadData()
    }
    
    
    /// Actualiza la lista de ingredientes
    ///
    /// - Parameter objIngredientItem: ingrediente editado
    func editIngredient(_ objIngredientItem: IngredientItem) {
        tableView.reloadData()
    }
}

