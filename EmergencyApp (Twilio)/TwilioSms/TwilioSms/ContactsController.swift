//
//  CustomizeController.swift
//  TwilioSms
//
//  Created by Emily on 3/1/17.
//  Copyright © 2017 Emily. All rights reserved.
//

//import UIKit
//import APAddressBook
//
//fileprivate let cellIdentifier = String(describing: UITableViewCell.self)
//
//class CustomizeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//

var animals: [String] = ["Name1", "Name2", "Name3", "Name4", "Name5", "Name6"]
var troll: [Int] = [6505754922, 6505754922, 6505754922, 6505754922, 6505754922, 6505754922, 6505754922]


import UIKit
class CustomizeController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let cellReuseIdentifier = "cell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var addContact: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:CollectionViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CollectionViewCell") as! CollectionViewCell

        cell.cellHeader.text = animals[indexPath.row]
        cell.cellSubtitle.text = String(troll[indexPath.row])
        tableView.rowHeight = 80
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
            animals.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // action one
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            print("Edit tapped")
        })
        editAction.backgroundColor = UIColor.blue
        
        // action two
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            print("Delete tapped")
        })
        deleteAction.backgroundColor = UIColor.red
        
        return [editAction, deleteAction]
    }
}

class CollectionViewCell: UITableViewCell {
    @IBOutlet var cellHeader: UILabel!
    @IBOutlet var cellSubtitle: UILabel!
}


//
//    let addressBook = APAddressBook()
//    var contacts = [APContact]()
//    
//    // MARK: - life cycle
//    
//    required init?(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder);
//        addressBook.fieldsMask = [APContactField.default, APContactField.thumbnail]
//        addressBook.sortDescriptors = [NSSortDescriptor(key: "name.firstName", ascending: true),
//                                       NSSortDescriptor(key: "name.lastName", ascending: true)]
//        addressBook.filterBlock =
//            {
//                (contact: APContact) -> Bool in
//                if let phones = contact.phones
//                {
//                    return phones.count > 0
//                }
//                return false
//        }
//        addressBook.startObserveChanges
//            {
//                [unowned self] in
//                self.loadContacts()
//        }
//    }
//    
//    // MARK: - appearance
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
//        loadContacts()
//    }
//    
//    // MARK: - actions
//    
////    @IBAction func reloadButtonPressed(_ sender: AnyObject)
////    {
////        loadContacts()
////    }
//    
//    // MARK: - private
//    
//    func loadContacts()
//    {
////        activity.startAnimating();
//        //load stuff?
//        addressBook.loadContacts{
//            
//            
//            
//                [unowned self] (contacts: [APContact]?, error: Error?) in
////                self.activity.stopAnimating()
//                self.contacts = [APContact]()
//                if let contacts = contacts
//                {
//                    self.contacts = contacts
//                    self.tableView.reloadData()
//                }
//                else if let error = error
//                {
//                    let alert = UIAlertView(title: "Error", message: error.localizedDescription,
//                                            delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//                }
//        }
//    }



// not loading the contacts

//extension CustomizeController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return contacts.count
//    }
//    
//    func tableView(_ tableView: UITableView,
//                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
//                                                 for: indexPath)
//        if let cell = cell as? TableViewCell {
//            cell.update(with: contacts[indexPath.row])
//        }
//        return cell
//    }
//}
//
//extension CustomizeController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
//    }
//}