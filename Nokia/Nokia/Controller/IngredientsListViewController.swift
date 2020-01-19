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

class IngredientsListViewController: UITableViewController{
    var arrBatters = [BatterCollectionItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let objBatter1 = BatterCollectionItem(name: "batter", arrBatter: [
            BatterItem(id: "1001", type: "Regular"),
            BatterItem(id: "1002", type: "Chocolate"),
            BatterItem(id: "1003", type: "Blueberry"),
            BatterItem(id: "1004", type: "Devil's Food")
            ])
        let objBatter2 = BatterCollectionItem(name: "topping", arrBatter: [
            BatterItem(id: "5001", type: "None"),
            BatterItem(id: "5002", type: "Glazed"),
            BatterItem(id: "5003", type: "Sugar"),
            BatterItem(id: "5003", type: "Powdered Sugar")
            ])
        arrBatters.append(objBatter1)
        arrBatters.append(objBatter2)
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBatters[section].arrBatter.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "IngredientItemCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientItemCell", for: indexPath)
        let objBatter = arrBatters[indexPath.section].arrBatter[indexPath.row]
        cell.textLabel?.text = objBatter.type
        cell.accessoryType = (objBatter.selected) ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrBatters[section].name
    }
    
    //MARK - Tableview Delegate Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrBatters.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objBatter = arrBatters[indexPath.section].arrBatter[indexPath.row]
        objBatter.selected = !objBatter.selected
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Ingredients
    
    @IBAction func addIngredientPressed(_ sender: Any) {
       
    }
}

//MARK: - Search bar methods
extension IngredientsListViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
}

//Editar ingredientes? que se edita?
//Se deben checkear todos los items?
//Se guardan los ingredientes al iniciar? o se guardan los ingredientes seleccionados?

