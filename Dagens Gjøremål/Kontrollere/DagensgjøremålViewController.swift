//
//  ViewController.swift
//  Dagens Gjøremål
//
//  Created by Rhs on 25/02/2019.
//  Copyright © 2019 Lcv-Rhs. All rights reserved.
//

import UIKit

class DagensgjøremålViewController: UITableViewController {
    
    var gjenstandRekke = [Ting]()
    
    let standard = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nyTing = Ting()
        nyTing.tittel = "Finn ei potet"
        gjenstandRekke.append(nyTing)
        
        let nyTing2 = Ting()
        nyTing2.tittel = "Skrell ei potet"
        gjenstandRekke.append(nyTing2)
        
        let nyTing3 = Ting()
        nyTing3.tittel = "Kok ei potet"
        gjenstandRekke.append(nyTing3)
        
         if let gjenstand = standard.array(forKey: "ÅGjøreListRekke") as? [Ting] {
        gjenstandRekke = gjenstand
            
        }
        
    }

    // Mark Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gjenstandRekke.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gjøremålcelle", for: indexPath)
        
        
        let gjøremål = gjenstandRekke[indexPath.row]
        
        cell.textLabel?.text = gjøremål.tittel
       
        //Ternary operator ==>
        //Value = condition ? valueIfTrue : valueIfFalse
        // hvis verdien til cellen
        cell.accessoryType = gjøremål.gjort ? .checkmark : .none
        
        
        return cell
    }
    
    //Mark TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(gjenstandRekke[indexPath.row])
      
        gjenstandRekke[indexPath.row].gjort = !gjenstandRekke[indexPath.row].gjort
        
        tableView.reloadData()
    
        tableView.deselectRow(at: indexPath, animated: true)
    }

//Mark - Legg Til Nye Ting.
    
    @IBAction func leggTilKnappTrykket(_ sender: UIBarButtonItem) {
        
        var tekstFelt = UITextField()
        
        let advarsel = UIAlertController(title: "Legg til nytt gjøremål", message: "", preferredStyle: .alert)
        
        let hendelse = UIAlertAction(title: "Legg til gjøremål", style: .default) { (hendelse) in
            //Det som skal skje når brukeren trykker på "Legg til gjøremål"-knappen på UIadvarselen vår.
          
            let nyTing = Ting()
            nyTing.tittel = tekstFelt.text!
    
            self.gjenstandRekke.append(nyTing)
            self.standard.set(self.gjenstandRekke, forKey: "ÅGjøreListRekke")
            
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

