Requirements:

XCode 7.2 (Swift 2.0)
deployment target iOS 9.2
CocoaPods 0.39.0

Instructions:

1. Unzip the file "APSportsKix.zip"
2. In the Unzipped Folder run the command "pod install"
3. Once that is completed, please open "APSportsKix.xcworkspace"
4. Ensure You can build the app "Cmd-B"
5. Sometimes Pods dont link up correctly, so if you get framework build errors, check the "Build Phases" tab on the project. There should be 4 items 
	- Alamofire.framework
	- SwiftyJSON.framework
	- XCLogger.framework
	- Pods.framework

6. If another API Key needs to be used, the following edit needs to be made...
	
	- line 22 in the file SportsKixRouter.swift 

	Replace the API KEY in <SAMPLE_API-KEY>
	
	static let headers = ["X-API-KEY": <SAMPLE_API-KEY>, "Content-type application":"json", "Accept application" : "json"]

	where "<SAMPLE_API-KEY>" needs to be replaced with the APIKEY so that it may look like this...

		static let headers = ["X-API-KEY": "zdtSIriNqVaAp5IMfqXhU42JasxNwElO6GePUrPm", "Content-type application":"json", "Accept application" : "json"]

Things that are not implemented:

- Filtering By Sport
- Mapping and location
- Specifying an arbitary number to limit the requests by... There are canned limits of 10, 20, 50 (default) & No Limits
