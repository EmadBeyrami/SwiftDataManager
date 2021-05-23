//
//  DataManager.swift
//
//  Created by Emad Bayramy on 8/23/20.
//  Copyright © 2021  Emad Bayramy All rights reserved.
//

import Foundation

class DataManager: NSObject {
	
    // MARK: - Singleton
    static var standard = DataManager()
	
    // MARK: - Saved Data
    @Storage(key: "KeyOfDataYouWantToSave", defaultValue: "DefaultValue")
    var dataYouWantToSave: String
    
    // MARK: - Setter
    func setData(data: String) {
        self.dataYouWantToSave = name
    }
}
