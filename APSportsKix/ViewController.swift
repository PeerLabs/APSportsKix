//
//  ViewController.swift
//  APSportsKix
//
//  Created by Abrar Peer on 21/03/2016.
//  Copyright © 2016 peerlabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

	@IBOutlet weak var limitPicker: UIPickerView!
	
	var limitPickerDataSource = ["∞ Venues", "10 Venues", "20 Venues", "50 Venues"];
	
	var limit : Int?
	
	override func viewDidLoad() {
		
		log.debug("Started!")
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		limitPicker.dataSource = self;
		limitPicker.delegate = self;
		
		limit = nil
		
		log.debug("Finished!")
	}

	override func didReceiveMemoryWarning() {
		
		log.debug("Started!")
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
		
		log.debug("Finished!")
	}
	
	//MARK: UIPickerViewDataSource Methods
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		
		log.debug("Started!")
		
		log.debug("Finished!")
		
		return 1
		
	}
 
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		
		log.debug("Started!")
		
		log.debug("Finished!")
		
		return limitPickerDataSource.count;
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		
		log.debug("Started!")
		
		log.debug("Finished!")
		
		return limitPickerDataSource[row]

	}
	
	//MARK: UIPickerViewDelegate Methods
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		log.debug("Started!")
		
		switch row {
			
		case 0:
			
			limit = nil
		case 1:
			
			limit = 10
			
		case 2:
			limit = 20
			
		case 3:
			
			limit = 50
			
		default:
			
			limit = nil
			
		}
		
		log.debug("Finished!")
		
	}
	
	// MARK: - Segues
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		log.debug("Started!")
		
		if segue.identifier == "requestVenuesSegue" {
			
			guard let venuesVC = segue.destinationViewController as? VenuesTableViewController else {
				
				log.debug("Finished!")
				
				return
				
			}
			
			venuesVC.limit = limit
			
		}
		
		log.debug("Finished!")
		
	}
 

}
