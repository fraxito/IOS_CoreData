//
//  ListaGatosTableViewController.swift
//  EjemploCoreData
//
//  Created by administrador on 13/2/17.
//  Copyright © 2017 administrador. All rights reserved.
//

import UIKit
import CoreData

class ListaGatosTableViewController: UITableViewController , NSFetchedResultsControllerDelegate{

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var resultados: NSFetchedResultsController<NSFetchRequestResult>!
    
    var managedObjectContext = NSManagedObjectContext()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.managedObjectContext = context
        
        let consulta : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Mascota")
        
        
        consulta.sortDescriptors = [NSSortDescriptor(key: "nombre", ascending: true)]
        
        resultados = NSFetchedResultsController(fetchRequest: consulta, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        resultados.delegate = self
        
       
        do {
            try resultados.performFetch()
        } catch {
            print("no se ha podido hacer la consulta")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case NSFetchedResultsChangeType.insert:
            self.tableView.insertRows(at:[IndexPath(row: 1, section: 0)], with: UITableViewRowAnimation.fade)
                break
        default : break
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
