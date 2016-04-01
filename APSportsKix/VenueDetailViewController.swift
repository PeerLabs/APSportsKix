//
//  VenueDetailViewController.swift
//  APSportsKix
//
//  Created by Abrar Peer on 21/03/2016.
//  Copyright © 2016 peerlabs. All rights reserved.
//

import UIKit

protocol VenueDetailDataSource {
	
	
	func venueDetailTailToDisplay() -> Venue?
	
}

class VenueDetailViewController: UIViewController {
	
	var delegate : VenueDetailDataSource?
	
	var venueDetail : Venue? = nil {
		
		didSet {
			
			guard venueDetail != nil else {
				
				venueYrOpened = "Unknown"
				venueCrowdCapacity = "Unknown"
				venueSeoUrl = "Unknown"
				venueURL = "unknown"
				return
				
			}
			
			if let yearOpened = venueDetail?.yearOpened {

				venueYrOpened = "\(yearOpened)"
			
			} else {
				
				venueYrOpened = "Unknown"

			}
			
			if let crowdCapacity = venueDetail?.crowdCapacity {
				
				venueCrowdCapacity = "\(crowdCapacity)"
				
			} else {
				
				venueCrowdCapacity = "Unknown"
				
			}
			
			if let seoUrl = venueDetail?.seoPageUrl {
				
				venueSeoUrl = seoUrl
				
			} else {
				
				venueYrOpened = "Unknown"
				
			}
			
			if let url = venueDetail?.url {
				
				venueURL = url
				
			} else {
				
				venueURL = "Unknown"
				
			}
			
		}
		
	}
	
	var venueYrOpened = "Unknown" {
		
		didSet {
			
			guard let label = yearOpenedLabel else {
				
				return
				
			}
			
			label.text = venueYrOpened
			
		}
		
	}
	
	var venueCrowdCapacity = "Unknown"  {
		
		didSet {
			
			guard let label = crowdCapacityLabel else {
				
				return
				
			}
			
			label.text = venueCrowdCapacity
			
		}
		
	}

	var venueSeoUrl = "Unknown"  {
		
		didSet {
			
			guard let label = seoUrlLabel else {
				
				return
				
			}
			
			label.text = venueSeoUrl
			
		}
		
	}

	var venueURL = "Unknown"  {
		
		didSet {
			
			guard let label = urlLabel else {
				
				return
				
			}
			
			label.text = venueURL

			
		}
		
	}

	

	@IBOutlet weak var yearOpenedLabel: UILabel!
	
	@IBOutlet weak var crowdCapacityLabel: UILabel!
	
	@IBOutlet weak var seoUrlLabel: UILabel!
	
	@IBOutlet weak var urlLabel: UILabel!
	
    override func viewDidLoad() {
		
		log.debug("Started!")
		
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		venueDetail = delegate?.venueDetailTailToDisplay()
		
		log.debug("Finished!")
		
    }

    override func didReceiveMemoryWarning() {
		
		log.debug("Started!")
		
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
		
		log.debug("Finished!")
		
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
