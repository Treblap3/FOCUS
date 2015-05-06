//
//  QuotesTableViewController.swift
//  FOCUS
//
//  Created by Adrien Villez on 5/4/15.
//  Copyright (c) 2015 AdrienVillez. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController
{
    // URL for (maybe) use of the JSON file online and/or use for updates.
    let quotesURL: String = "https://dl.dropboxusercontent.com/u/73002295/focusApp_quotes.json"
    var quoteArray: [Quotes] = [Quotes]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Gets the latest quotes
        self.getLatestQuotes()
        
        // Self sizing cells:
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return quoteArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! QuoteCustomCell

        cell.quoteCellLabel.text = quoteArray[indexPath.row].quote
        cell.authorCellLabel.text = "\"" + quoteArray[indexPath.row].author + "\""
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - JSON Data:
    
    func getLatestQuotes()
    {
        let request = NSURLRequest(URL: NSURL(string: quotesURL)!)
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if error != nil
            {
                println(error.localizedDescription)
            }
            
            // Parse JSON Data:
            self.quoteArray = self.parseJSONData(data)
            
            // Reload the table view:
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
            
        })
        
        task.resume()
    }
    
    func parseJSONData(data: NSData) -> [Quotes]
    {
        var quotes = [Quotes]()
        var error: NSError?
        
        let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary
        
        if error != nil
        {
            println(error?.localizedDescription)
        }
        
        // Parse JSON data:
        let jsonQuotes = jsonResult?["quotes_en"] as! [AnyObject]
        for jsonQuote in jsonQuotes
        {
            let quote = Quotes()
            quote.quote = jsonQuote["quote"] as! String
            quote.author = jsonQuote["author"] as! String
            
            quotes.append(quote)
        }
        
        return quotes
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
