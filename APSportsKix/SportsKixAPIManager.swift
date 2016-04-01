//
//  SportsKixAPIManager.swift
//  APSportsKix
//
//  Created by Abrar Peer on 21/03/2016.
//  Copyright © 2016 peerlabs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SportsKixAPIManager {
	
	static let sharedInstance = SportsKixAPIManager()
	
	var alamofireManager:Alamofire.Manager
	
	let headers = ["Accept": "application/json"]
	
	init () {
		
		log.debug("Started!")
		
		let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
		alamofireManager = Alamofire.Manager(configuration: configuration)
		
		log.debug("Finished!")
		
	}
	
	func getVenuesWithLimit(limit: Int?, completionHandler: (Result<[Venue], NSError>) -> Void){
				
		log.debug("Started!")
		
		guard limit != nil else {
			
			Alamofire.request(SportsKixVenueRouter.GetVenues())
			
			.responseArray {
				
				(response: Response<[Venue], NSError>) -> Void in
					
				completionHandler(response.result)
	
			}
			
			log.debug("Finished!")
			
			return
			
		}
		
		switch limit! {
			
		case 10:
			
			Alamofire.request(SportsKixVenueRouter.Get10Venues())
			
			.responseArray {
				
				(response: Response<[Venue], NSError>) -> Void in
				
				completionHandler(response.result)
					
			}
			
			
		case 20:
			
			Alamofire.request(SportsKixVenueRouter.Get20Venues())
				
			.responseArray {
				
				(response: Response<[Venue], NSError>) -> Void in
				
				completionHandler(response.result)
					
			}

			
		case 50:
			
			Alamofire.request(SportsKixVenueRouter.Get50Venues())
				
				.responseArray {
					
					(response: Response<[Venue], NSError>) -> Void in
					
					completionHandler(response.result)
					
			}
			
		default:
			
			Alamofire.request(SportsKixVenueRouter.GetVenues())
				
				.responseArray {
					
					(response: Response<[Venue], NSError>) -> Void in
					
					completionHandler(response.result)
					
			}
			
		}
		
		
		Alamofire.request(SportsKixVenueRouter.GetVenues())

			.responseArray { (response: Response<[Venue], NSError>) -> Void in

			completionHandler(response.result)

		}
		
		
		
	}
	
	func printVenues(limit: Int?) {
		
		log.debug("Started!")
		
		Alamofire.request(SportsKixVenueRouter.GetVenues()) .responseString { response in
			
			if let receivedString = response.result.value {
				
				print(receivedString)
				
			}
		}
		
		log.debug("Finished!")
		
	}
	
	func printVenuesWithLimit(limit: Int?) {
		
		log.debug("Started!")
		
		guard limit != nil else {
			
			Alamofire.request(SportsKixVenueRouter.GetVenues()) .responseString { response in
				
				if let receivedString = response.result.value {
					
					print(receivedString)
					
				}
			}
			
			log.debug("Finished!")
			
			return
			
		}
		
		if limit <= 10 {
			
			Alamofire.request(SportsKixVenueRouter.Get10Venues()) .responseString { response in
				
				if let receivedString = response.result.value {
					
					print(receivedString)
					
				}
			}
			
			log.debug("Finished!")
			
			return
			
			
		} else if limit <= 20 {
			
			Alamofire.request(SportsKixVenueRouter.Get20Venues()) .responseString { response in
				
				if let receivedString = response.result.value {
					
					print(receivedString)
					
				}
			}
			
			log.debug("Finished!")
			
			return
			
		} else {
			
			Alamofire.request(SportsKixVenueRouter.GetVenues()) .responseString { response in
				
				if let receivedString = response.result.value {
					
					print(receivedString)
					
				}
			}
			
			log.debug("Finished!")
			
			return
			
		}
		
	}
	
}

