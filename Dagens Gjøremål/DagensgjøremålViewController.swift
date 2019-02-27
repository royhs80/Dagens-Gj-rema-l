//
//  ViewController.swift
//  Dagens Gjøremål
//
//  Created by Rhs on 25/02/2019.
//  Copyright © 2019 Lcv-Rhs. All rights reserved.
//

import UIKit

class DagensgjøremålViewController: UITableViewController {
    
    let gjenstandRekke = ["Finn ei potet", "Gå og legg deg", "Hopp over gjerdet"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Mark Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gjenstandRekke.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gjøremålcelle", for: indexPath)
        
        cell.textLabel?.text = gjenstandRekke[indexPath.row]
        
        return cell
    }
    
    //Mark TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(gjenstandRekke[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

