//
//  Venue.swift
//  APSportsKix
//
//  Created by Abrar Peer on 21/03/2016.
//  Copyright © 2016 peerlabs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Venue : ResponseJSONObjectSerializable {
	
	var id: String?
	var title: String?
	var yearOpened : Int?
	var crowdCapacity: Int?
	var seoPageUrl: String?
	var url: String?
	
	required init(json: JSON) {
		
		self.id = json["id"].string
		self.title = json["Title"].string
		self.yearOpened = json["YearOpened"].int
		self.crowdCapacity = json["CrowdCapacity"].int
		self.seoPageUrl = json["SeoPageUrl"].string
		self.url = json["URL"].string
		
	}
	
	required init() {
		
	}
}
