//
//  DataManager.swift
//
//  Created by Don on 8/23/19.
//  Copyright © 2019 Don. All rights reserved.
//

import Foundation

class DataManager: NSObject, TokenManagable {
	
	// MARK: - Singleton

    static var standard = DataManager()
	
	// MARK: - Saved Data
	@Storage(key: "user", defaultValue: "")
	var username: String
    
    @Storage(key: "userID", defaultValue: "")
    var userID: String
    
    @Storage(key: "avatar", defaultValue: "")
    var avatar: String
	
	@Storage(key: "token", defaultValue: "")
	var token: String
    
	@Storage(key: "refreshToken", defaultValue: "")
	var refreshToken: String
	
	@Storage(key: "registerFinished", defaultValue: true)
	var didFinishRegistering: Bool
	
	@Storage(key: "firstProfileVisit", defaultValue: true)
	var firstProfileVisit: Bool
	
    @Storage(key: "shouldSendNotificationUserId", defaultValue: false)
    var shouldSendNotificationUserId: Bool
    
    @Storage(key: "database.temporary.id", defaultValue: 0)
    var databaseCurrentTempId: Int

    @Storage(key: "currentActiveChatUserId", defaultValue: 0)
    var currentActiveChatUserId: Int
    
    @Storage(key: "consent", defaultValue: "")
    var consentMessage: String
    
    @Storage(key: "trialID", defaultValue: 0)
    var trialID: Int
    
    @Storage(key: "patientID", defaultValue: 0)
    var patientID: Int
    
    @Storage(key: "subTrialName", defaultValue: subTrialNames.test.rawValue)
    var subTrialName: String
    
//    @Storage(key: "lastLocation", defaultValue: LocationModel())
//    var lastLocation: LocationModel
    
    @Storage(key: "name", defaultValue: "")
    var userName: String
    
    func setName(name: String) {
        self.userName = name
    }
    
    func setSubTrialName(name: String) {
        self.subTrialName = name
    }
    
    
    func setConsentMessage(_ message: String) {
        self.consentMessage = message
    }
    
    func getConsentMessage() -> String {
        return self.consentMessage
    }
    

	func setToken(token: String) {
		self.token = token
	}
    
    func setDatabase(temporaryID: Int) {
        self.databaseCurrentTempId = temporaryID
    }
    
    func setUserID(userID: String) {
        self.userID = userID
    }
    
    func setTrialID(id: Int) {
        self.trialID = id
    }
    
    func setPatientID(id: Int) {
        self.patientID = id
    }
    
    func setAvatar(url: String) {
        self.avatar = url
    }
    
    func shouldSendNotificationUserId(to changed: Bool) {
        self.shouldSendNotificationUserId = changed
    }
    
    func setCurrentActiveChat(to userId: Int) {
        self.currentActiveChatUserId = userId
    }
    
    func removeCurrentActiveChat() {
        self.currentActiveChatUserId = 0
    }
    
//    func setLastLocation(to newLocation: LocationModel) {
//        lastLocation = newLocation
//    }
    
    func isLogin() -> Bool {
        !token.isEmpty
    }
    
	func didLogin(with username: String, token: String) {
		self.username = username.lowercased()
		self.token = token
		self.didFinishRegistering = true
	}
    
	func didRegister(with username: String, token: String) {
		self.username = username.lowercased()
		self.token = token
		self.didFinishRegistering = false
	}
    
    func HelloMessage() -> String {
        return "Hello, " + self.userName
    }
    
	func logout() {
        
        let id = DataManager.standard.userID
        let trialId = DataManager.standard.trialID
        let patientId = DataManager.standard.patientID
        FCMManager.unsubscribeFrom("patient-" + "\(patientId)")
        FCMManager.unsubscribeFrom("trialpatient-" + "\(trialId)")
        FCMManager.unsubscribeFrom("person-" + id)
        FCMManager.unsubscribeFrom("app-diabetes")
        
        self.token = ""
        self.refreshToken = ""
        self.username = ""
        self.avatar = ""
        self.userName = ""
        self.patientID = 0
        self.userID = ""
        self.trialID = 0
        self.currentActiveChatUserId = 0
        
        
//        self.lastLocation = LocationModel()
        
        /// remove all data after log out.
//        Database.shared.removeAllData()
        
        /// Stop any local notification after log out.
//        LocalNotification.shared.stopSendingNotifications()
        
        /// Removing External User Id with Callback Available in SDK Version 2.13.1+
//        OneSignal.removeExternalUserId({ results in
//            OneSignal.setSubscription(false)
//
//            // The results will contain push and email success statuses
//            print("External user id update complete with results: ", results!.description)
//            // Push can be expected in almost every situation with a success status, but
//            // as a pre-caution its good to verify it exists
//            if let pushResults = results!["push"] {
//                print("Remove external user id push status: ", pushResults)
//            }
//            // Verify the email is set or check that the results have an email success status
//            if let emailResults = results!["email"] {
//                print("Remove external user id email status: ", emailResults)
//            }
//        })
	}
	
}
