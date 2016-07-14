//
//  ListTableViewController.swift
//  first-version
//
//  Created by user on 11.07.16.
//  Copyright © 2016 volka. All rights reserved.
//

import UIKit
import KFSwiftImageLoader
class ListTableViewController: UITableViewController {
    var list = [List]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.findListAsync()
    }

   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
       // print(list.count)
        return list.count
        
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as! ListTableViewCell
        
        cell.titleLabel.text = list[indexPath.row].title
        cell.subtitleLabel.text = list[indexPath.row].subtitle
        
        cell.stateLabel.text = list[indexPath.row].state
        
        
        print(list[indexPath.row].image)
     
        if let url = list[indexPath.row].image {
            cell.videoImageView.loadImageFromURLString(url, placeholderImage: UIImage(named: "placeholder"), completion: nil)
        }

            
        
        
        
        
        return cell
        
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("DetailSegue", sender:  indexPath)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //SegueApartment
        
        if segue.identifier == "DetailSegue"{
            let vTVC = segue.destinationViewController as! VideoViewController
            let index = sender as! NSIndexPath
            vTVC.list = list[index.row]
            
        }
        
    }



    func findListAsync() {
        
        let dataStore = Backendless.sharedInstance().data.of(List.ofClass())
        
        dataStore.find(
            { (result: BackendlessCollection!) -> Void in
                let lists = result.getCurrentPage()
                for obj in lists {
                    let list = obj as! List
                    self.list.append(list)
                }
                
                self.tableView.reloadData()
            },
            error: { (fault: Fault!) -> Void in
                print("Server reported an error: \(fault)")
        })
    }

    
    
}
