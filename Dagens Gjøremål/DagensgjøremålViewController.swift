//
//  ViewController.swift
//  Dagens Gjøremål
//
//  Created by Rhs on 25/02/2019.
//  Copyright © 2019 Lcv-Rhs. All rights reserved.
//

import UIKit

class DagensgjøremålViewController: UITableViewController {
    
    var gjenstandRekke = ["Finn ei potet", "Gå og legg deg", "Hopp over gjerdet"]

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

//Mark - Legg Til Nye Ting.
    
    @IBAction func leggTilKnappTrykket(_ sender: UIBarButtonItem) {
        
        var tekstFelt = UITextField()
        
        let advarsel = UIAlertController(title: "Legg til nytt gjøremål", message: "", preferredStyle: .alert)
        
        let hendelse = UIAlertAction(title: "Legg til gjøremål", style: .default) { (hendelse) in
            //Det som skal skje når brukeren trykker på "Legg til gjøremål"-knappen på UIadvarselen vår.
            self.gjenstandRekke.append(tekstFelt.text!)
            
            self.tableView.reloadData()
        }
        advarsel.addTextField { (advarselTekstFelt) in
            advarselTekstFelt.placeholder = "Legg til gjøremålet"
            
            tekstFelt = advarselTekstFelt
            print("nå")
        }
        advarsel.addAction(hendelse)
        present(advarsel, animated: true, completion: nil)
    
    }
    
}

