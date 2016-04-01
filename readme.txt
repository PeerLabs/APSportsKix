Requirements:

XCode 7.3 (Swift 2.0+)
deployment target iOS 9.2
CocoaPods 0.39.0

Instructions:

1. Clone the project to a local folder:
	- First ensure that you have Git Installed as well as a registered GitHub account on you local computer.
	- In the command line go to a particular location and run the following command: “git clone https://github.com/PeerLabs/APSportsKix.git”
		- This will clone the repository into a subfolder called “APSportsKix”
	- From this point onwards the commands need to be run within the “APSportsKix” folder
2. Run the command "pod install"
3. Once that is completed, please open "APSportsKix.xcworkspace"
4. Change the bundle identifier to something that may make sense to you: it is currently “com.peerlabs.apsportskix” so change it to a reverse dns-like identifier eg: com.sportskix.APSportsKix
5. Ensure You can build the app "Cmd-B"
6. Sometimes Pods dont link up correctly, so if you get framework build errors, check the "Build Phases" tab on the project. There should be 4 items 
	- Alamofire.framework
	- SwiftyJSON.framework
	- XCLogger.framework
	- Pods.framework

7. If another API Key needs to be used, the following edit needs to be made...
	
	- line 22 in the file SportsKixRouter.swift 

	Replace the API KEY in <SAMPLE_API-KEY>
	
	static let headers = ["X-API-KEY": <SAMPLE_API-KEY>, "Content-type application":"json", "Accept application" : "json"]

	where "<SAMPLE_API-KEY>" needs to be replaced with the APIKEY so that it may look like this...

		static let headers = ["X-API-KEY": "zdtSIriNqVaAp5IMfqXhU42JasxNwElO6GePUrPm", "Content-type application":"json", "Accept application" : "json"]

Things that are not implemented:

- Filtering By Sport
- Mapping and location
- Specifying an arbitary number to limit the requests by... There are canned limits of 10, 20, 50 (default) & No Limits
