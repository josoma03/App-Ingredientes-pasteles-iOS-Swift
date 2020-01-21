import Foundation


//
//  IngredientsListViewController
//  Nokia
//  Permite Listar de los ingredientes para preparar el pastel.
//  Se pueden seleccionar un item a la vez
//
//  Created by Jhonattan Solarte Martinez on 18/01/20.
//  Copyright © 2020 Nokia. All rights reserved.

import UIKit
import RealmSwift

protocol AddIngredientsDelegate{
    func addIngredient(_ arrIngredientsNews: [IngredientItem], _ type: TypeIngredient)
}

class IngredientsListViewController: UITableViewController{
    var arrIngredients : Results<IngredientItem>?
    var typeItem : TypeIngredient!
    var delegate : AddIngredientsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadItems()
        self.title = (typeItem == TypeIngredient.Batters) ? Utils.stringNamed("Batters"): Utils.stringNamed("Topping")
        tableView.register(UINib(nibName: Constants.cellIngredient, bundle: nil), forCellReuseIdentifier: Constants.cellIngredient)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func loadItems(){
        arrIngredients = RealmDB.shared().getIngredientsDeletedByType(typeItem.rawValue)
        if arrIngredients?.count == 0{
            self.showToast(message: Utils.stringNamed("All_ingredients_have_already_been_added"))
        }
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrIngredients?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIngredient) as! IngredientCell
        if let objIngredient = arrIngredients?[indexPath.row]{
            cell.setValuesByIngredient(objIngredient)
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 50
    }
    
    
    //MARK - Tableview Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objIngredient = arrIngredients?[indexPath.row]{
            try! RealmDB.shared().realm.write {
                objIngredient.selected = !objIngredient.selected
            }
            
            tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    //MARK - Add New Ingredients
    
    @IBAction func addIngredientPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        var arrSelected = [IngredientItem]()
        try! RealmDB.shared().realm.write {
            for item in self.arrIngredients! {
                if item.selected{
                    item.selected = false
                    arrSelected.append(item)
                }
            }
        }
        delegate?.addIngredient(arrSelected, typeItem);
        
        
    }
}

//MARK: - Search bar methods
extension IngredientsListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchByName(searchBar.text!)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchByName(searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchByName(searchText)
    }
    
    func searchByName(_ searchText: String){
        if searchText.isEmpty{
            loadItems()
        }else{
            arrIngredients = RealmDB.shared().getIngredientsByTypeAndName(typeItem.rawValue, searchText)
        }
        tableView.reloadData()
    }
}

