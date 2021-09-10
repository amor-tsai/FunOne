//
//  TableViewController.swift
//  FunOne
//
//  Created by Amor on 2021/9/9.
//

import UIKit

class TableViewController: UITableViewController {

    lazy var tableModel:TableModel = {
        return TableModel.sharedInstance()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return self.tableModel.numberOfItems()
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
                let name = self.tableModel.getNameWithIndex(index: indexPath.row)
                cell.textLabel?.text = name
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
                cell.textLabel?.text = "ALL Pokemon Images"
                cell.detailTextLabel?.text = "Summary"
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MagicCell", for: indexPath)
                cell.textLabel?.text = "To see a lable changing its color by time"
                cell.detailTextLabel?.text = "Tap to see it"
                return cell
        }
        
        // Configure the cell...

    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if  let vc = segue.destination as? CScorllViewController,
            let cell = sender as? UITableViewCell,
            let name = cell.textLabel?.text {
            vc.displayImageName = name
        }
        
        if let vc = segue.destination as? CMagicViewController {
            vc.lableText = "Begin to change color"
        }

    }
    

}
