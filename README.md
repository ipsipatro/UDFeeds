# UDFeeds

## Usage
On launch, the app fetches the feeds from a service and also saves them in the device database using realm and displays them in a list. 
The List screen contains a 'Add Content' button, on tap of it the user will navigate to add content screen.
User needs to enter a title and the body of the feed which will enable the 'Upload' button.
On tap of the upload button, the app is not doing any service request at this moment. It just adds the newly added feed to the existing feeds list and persists them using realm.
After uploading a feed app shows a success message. If you want to add another feed, it can be done in the same screen or else the back button will take the user back to the feeds list screen.

## How to run
To run the app:
Please download the repo from https://github.com/ipsipatro/UDFeeds link  and unzip it.
Inside the main project folder there is a UDFeeds.xcworkspace file. Please click that file to open the app on Xcode. 
Select a device/simulator to run. 
Run all the UI and Unit test cases tests by choosing Product > Test. Click the Test Navigator icon to view the status and results of the tests. Before running the tests please make sure keyboard appears for simultor for both textfield and textview. Otherwise UI test case may fail as unable to enter text.

## Technical Information
The app is designed in MVP pattern. All features have a view controller, presenter and interactor.
Used dependency injection to inject required objects.
USed Realm to persist the data.

