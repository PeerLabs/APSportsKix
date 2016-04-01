//
//  VenuesTableViewController.swift
//  APSportsKix
//
//  Created by Abrar Peer on 21/03/2016.
//  Copyright © 2016 peerlabs. All rights reserved.
//

import UIKit

class VenuesTableViewController: UITableViewController, VenueDetailDataSource {
	
	
	var venues = [Venue]() {
		
		didSet {
			
			self.tableView.reloadData()
			
		}
		
	}
	
	var selectedVenue : Venue?
	
	var limit : Int?

    override func viewDidLoad() {
		
		log.debug("Started!")
		
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		self.title = "Venues List"
				
		log.debug("Finished!")
		
    }
	
	override func viewDidAppear(animated: Bool) {
		
		log.debug("Started!")
		
		loadVenues()
		
		log.debug("Finished!")
		
	}

    override func didReceiveMemoryWarning() {
		
		log.debug("Started!")
		
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
		
		log.debug("Finished!")
		
		
    }
	
	// MARK: - PrepareForSegue
 
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		log.debug("Started!")
		
		if segue.identifier == "showDetail" {
			
			guard let venueDetailVC = segue.destinationViewController as? VenueDetailViewController else {
				
				log.debug("Finished!")
				
				return
				
			}
			
			venueDetailVC.delegate = self
			
		}
		
		log.debug("Finished!")
		
	}

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
		
		log.debug("Started!")
		
		log.debug("Finished!")
		
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		
		log.debug("Started!")
		
		log.debug("Finished!")
		
        return self.venues.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VenueCell", forIndexPath: indexPath)

		let venue = venues[indexPath.row]
		
		cell.textLabel!.text = venue.title
		
		guard let venueId = venue.id else {
			
			cell.detailTextLabel!.text = "ID: Unknown"
			
			log.debug("Finished!")
			
			return cell
			
		}
		
		cell.detailTextLabel!.text = "ID: \(venueId)"
		
		log.debug("Finished!")
		
		return cell

    }
	
	// MARK: Tablview Delegate
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		log.debug("Started!")
		
		selectedVenue = venues[indexPath.row]
		
		log.debug("Finished!")
		
	}
	
	func loadVenues() {
		
		
		log.debug("Started!")
		
		
		guard let filterLimit = limit else {
			
			SportsKixAPIManager.sharedInstance.getVenuesWithLimit(nil, completionHandler: { result in
				
				guard result.error == nil else {
					
					print(result.error)
					
					// TODO: display error
					
					return
					
				}
				
				if let fetchedVenues = result.value {
					
					self.venues = fetchedVenues
					
				}
			})
			
			log.debug("Finished!")
			
			return
			
		}
		
		switch filterLimit {
			
			
		case 10:
			
			SportsKixAPIManager.sharedInstance.getVenuesWithLimit(10, completionHandler: { result in
				
				guard result.error == nil else {
					
					print(result.error)
					
					// TODO: display error
					
					return
					
				}
				
				if let fetchedVenues = result.value {
					
					self.venues = fetchedVenues
					
				}
			})
			
		case 20:
			
			SportsKixAPIManager.sharedInstance.getVenuesWithLimit(20, completionHandler: { result in
				
				guard result.error == nil else {
					
					print(result.error)
					
					// TODO: display error
					
					return
					
				}
				
				if let fetchedVenues = result.value {
					
					self.venues = fetchedVenues
					
				}
			})

			
		case 50:
			
			SportsKixAPIManager.sharedInstance.getVenuesWithLimit(50, completionHandler: { result in
				
				guard result.error == nil else {
					
					print(result.error)
					
					// TODO: display error
					
					return
					
				}
				
				if let fetchedVenues = result.value {
					
					self.venues = fetchedVenues
					
				}
			})

			
		default:
			
			SportsKixAPIManager.sharedInstance.getVenuesWithLimit(nil, completionHandler: { result in
				
				guard result.error == nil else {
					
					print(result.error)
					
					// TODO: display error
					
					return
					
				}
				
				if let fetchedVenues = result.value {
					
					self.venues = fetchedVenues
					
				}
			})

		}
		
		log.debug("Finished!")
	
	}
	
	
	//MARK: VenueDetailDataSource
	
	func venueDetailTailToDisplay() -> Venue? {
		
		log.debug("Started!")
		
		log.debug("Finished!")
		
		return selectedVenue

	}
	
	@IBAction func showAlertViewController(sender: UIBarButtonItem) {
		
		log.debug("Started!")

		
		if (self.presentedViewController != nil) {
			
			self.dismissViewControllerAnimated(true, completion: {
				
				let alertTitle = "APSportskix - Action Not Supported!"
				
				let alertMessage = "Sorry this feature is not yet supported!"
				
				
				let alertControler = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
				
				let retryAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
					
					
				})
				
				alertControler.addAction(retryAction)
				
				self.presentViewController(alertControler, animated: true, completion: nil)
				
			})
			
		} else {
			
			let alertTitle = "APSportskix - Action Not Supported!"
			
			let alertMessage = "Sorry this feature is not yet supported!"
			
			
			let alertControler = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert)
			
			let retryAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
				
				
			})
			
			alertControler.addAction(retryAction)
			
			self.presentViewController(alertControler, animated: true, completion: nil)
			
		}
		
		log.debug("Finished!")
		
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
