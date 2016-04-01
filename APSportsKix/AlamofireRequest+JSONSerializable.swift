//
//  AlamofireRequest+JSONSerializable.swift
//  APSportsKix
//
//  Created by Abrar Peer on 21/03/2016.
//  Copyright © 2016 peerlabs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension Alamofire.Request {
	
	public func responseArray<T: ResponseJSONObjectSerializable>(completionHandler:Response<[T], NSError> -> Void) -> Self {
		
		let serializer = ResponseSerializer<[T], NSError> { request, response, data, error in
			
			guard error == nil else {
			
			return .Failure(error!)
			
			}
			
			guard let responseData = data else {
				
				let failureReason = "Array could not be serialized because input data was nil."
				
				let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
				
				return .Failure(error)
				
			}
			
			let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
			
			let result = JSONResponseSerializer.serializeResponse(request, response, responseData, error)
			
			switch result {
				
			case .Success(let value):
				
				let json = SwiftyJSON.JSON(value)
			
			var objects: [T] = []
			
			for (_, item) in json {
				
				if let object = T(json: item) {
				
				objects.append(object)
				
				}
				
			}
			
			return .Success(objects)
				
			case .Failure(let error):
				
				return .Failure(error)
				
			}
			
		}
		
		return response(responseSerializer: serializer, completionHandler: completionHandler)
		
	}
	
}
