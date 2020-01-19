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

class CakeListViewController: UITableViewController {
    let arrIngredients = ["1", "2"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrIngredients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "IngredientItemCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientItemCell", for: indexPath)
        cell.textLabel?.text = arrIngredients[indexPath.row]
        return cell
    }

    //MARK - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK - Add New Ingredients
    
    @IBAction func addIngredientPressed(_ sender: Any) {
    }
}

//Editar ingredientes? que se edita?
//Se deben checkear todos los items?
//Se guardan los ingredientes al iniciar? o se guardan los ingredientes seleccionados?

