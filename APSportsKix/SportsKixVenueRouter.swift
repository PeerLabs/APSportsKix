//
//  SportsKixRouter.swift
//  APSportsKix
//
//  Created by Abrar Peer on 21/03/2016.
//  Copyright © 2016 peerlabs. All rights reserved.
//

import Foundation
import Alamofire

enum SportsKixVenueRouter : URLRequestConvertible {
	
	static let baseURLString = "https://candidate-test.sportkix.com"
	
	/* Replace the API KEY in <SAMPLE_API-KEY>
	
	 // static let headers = ["X-API-KEY": <SAMPLE_API-KEY>, "Content-type application":"json", "Accept application" : "json"]

	*/
	
	static let headers = ["X-API-KEY": "zdtSIriNqVaAp5IMfqXhU42JasxNwElO6GePUrPm", "Content-type application":"json", "Accept application" : "json"]
	
	static var defaultlLimitParams = ["limit": "{\"limit\": 50}"] // set the default limit 50
	static var limit10Param = ["limit": "{\"limit\": 10}"]// set the default limit 10
	static var limit20Param = ["limit": "{\"limit\": 20}"] // set the default limit 20
	
	case GetVenues() // GET https://candidate-test.sportkix.com/venues/
	case Get10Venues() // GET https://candidate-test.sportkix.com/venues?limit=%7B"limit"%3A150%7D
	case Get20Venues() // GET https://candidate-test.sportkix.com/venues?limit=%7B"limit"%3A150%7D
	case Get50Venues() // GET https://candidate-test.sportkix.com/venues?limit=%7B"limit"%3A150%7D
	
	
	
	var URLRequest: NSMutableURLRequest {
		
		var method: Alamofire.Method {
			
			switch self {
				
			case .GetVenues:
				
				return .GET
				
			case .Get10Venues:
				
				return .GET
				
			case .Get20Venues:
				
				return .GET
				
			case .Get50Venues:
				
				return .GET
				
			}
			
		}
		
		let result : (path: String, parameters: [String : AnyObject]?) = {
			
			switch self {
		
			// Endpoints
			case .GetVenues:
				
				return ("/venues", nil)
				
			case .Get10Venues:
			
				return ("/venues",  SportsKixVenueRouter.limit10Param)
			
			case .Get20Venues:
			
				return ("/venues", SportsKixVenueRouter.limit20Param)
				
			case .Get50Venues:
				
				return ("/venues", SportsKixVenueRouter.defaultlLimitParams)
			
			}
			
		}()
		
		let URL = NSURL(string: SportsKixVenueRouter.baseURLString)!
		
		let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
		
//		URLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
		URLRequest.addValue("zdtSIriNqVaAp5IMfqXhU42JasxNwElO6GePUrPm", forHTTPHeaderField: "X-API-KEY")
		
		let encoding = Alamofire.ParameterEncoding.URL
		
		//log.debug("\(result.parameters!)")
		
		let (encodedRequest, _) = encoding.encode(URLRequest, parameters: result.parameters)
		
		encodedRequest.HTTPMethod = method.rawValue
		
		log.debug("\(encodedRequest.URL)")
		
		return encodedRequest
		
	}
	
}

