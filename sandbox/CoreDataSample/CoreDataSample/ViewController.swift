//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Hyunseok Yang on 2020/11/01.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Get items from Core Data
        fetchPeople()
    }

    func fetchPeople() {
        
        // Fetch the data from Core Dara to display in the tableview
        do {
            let request = Person.fetchRequest() as NSFetchRequest<Person>
            
            // Set the filtering and sorting
            //let pred = NSPredicate(format: "name CONTAINS %@", "johan")
            //request.predicate = pred
            
            //let sort = NSSortDescriptor(key: "name", ascending: true)
            //request.sortDescriptors = [sort]
            
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            
        }
    }
    
    @IBAction func addTapped(_sender: Any) {
        
        // Creat alert
        let alert = UIAlertController(title: "Add Person", message: "What is their name?", preferredStyle: .alert)
        alert.addTextField()
        
        // Configure button handler
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            
            // Get the textfield for the alert
            let textfield = alert.textFields![0]
            
            // Create a person object
            let newPerson = Person(context: self.context)
            newPerson.name = textfield.text
            newPerson.age = 20
            newPerson.gender = "Male"
            
            // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
            
            // Re-fetch the data
            self.fetchPeople()
        }
        
        // Add button
        alert.addAction(submitButton)
        
        // Show alert
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func sort(_sender: Any) {
        
        do {
        let request = Person.fetchRequest() as NSFetchRequest<Person>
        
        // Set the filtering and sorting
        //let pred = NSPredicate(format: "name CONTAINS %@", "johan")
        //request.predicate = pred
        
        let sort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sort]
        
        self.items = try context.fetch(request)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        }
        catch {

        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of people
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        // Get person from array and set the label
        let person = self.items![indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Selected alert
        let person = self.items![indexPath.row]
        
        // Creat alert
        let alert = UIAlertController(title: "Edit Person", message: "Edit name:", preferredStyle: .alert)
        alert.addTextField()
        
        let textfield = alert.textFields![0]
        textfield.text = person.name
        
        // Configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            
            // Get the textfield for the alert
            let textfield = alert.textFields![0]
            
            // Edit name property of person object
            person.name = textfield.text
            
            // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
            
            // Re-fetch the data
            self.fetchPeople()
            
        }
        
        // Add button
        alert.addAction(saveButton)
        
        // Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Creat swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            // Which person to remove
            let personToRemove = self.items![indexPath.row]
            
            // Remone the person
            self.context.delete(personToRemove)
            
            // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
            // Re-fetch the data
            self.fetchPeople()        }
        
        // Return swipe actions
        return UISwipeActionsConfiguration(actions: [action])
    }
}

