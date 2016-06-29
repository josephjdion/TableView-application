//
//  TableViewController.swift
//  Table application
//
//  Created by Joseph Dion on 6/27/16.
//  Copyright © 2016 Joe. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
//    var pic1 = Picture(Image: "Golden", Locaiton: "Golden Gate Park")
//    var pic2 = Picture(Image: "GoldenStatue", Locaiton: "Golden Gate Park")
//    var pic3 = Picture(Image: "Santa", Locaiton: "Santa Cruz")
//    var pic4 = Picture(Image: "Yosemite", Locaiton: "Yosemite")
//    var pic5 = Picture(Image: "SF", Locaiton: "San Francisco")
    
    
    // Collection of picture objects
    var album = [Picture(Image: "Golden", Locaiton: "Golden Gate Park"), Picture(Image: "GoldenStatue", Locaiton: "Golden Gate Park"), Picture(Image: "Santa", Locaiton: "Santa Cruz"), Picture(Image: "Yosemite", Locaiton: "Yosemite"), Picture(Image: "SF", Locaiton: "San Francisco")]
    
    func loadMoreImages() {
        
        album.append(Picture(Image: "Jenner", Locaiton: "Jenner By The Sea"))
        album.append(Picture(Image: "San Jose", Locaiton: "Downtown San Jose"))
        
    }
    
    
    
    // Passing data from one viewcontroller to another
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Checks what segue is executing
        if segue.identifier == "ShowImage" {
        
            // This creates the variable indexpath and makes sure the value is not nil
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                // Creates a variable called destinationViewController that makes it easy to refer to the 
                // Destination View Controller
                let destinationController = segue.destinationViewController as! BigImageViewController
                
                
                // Lets the destination viewController have the same image as the one we just clicked on
                destinationController.pic = album[indexPath.row]
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sets the height of the cells programatically
        tableView.rowHeight = 200.0
        loadMoreImages()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // Number of sections 
    // Just one
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // This gives the number of rows to
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       // print(album.count)
        
        return album.count
    }

    //  actually populates the viewController
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Specifies where to put the cell
        let cellIdentifier = "Cell"
        
        // Creates the Cell
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        // Sets the info for the cell
        cell.backgroundImage.image = UIImage(named: album[indexPath.row].image)
        cell.locationLabel.text = album[indexPath.row].location
        
        // returns the cell we just created
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
