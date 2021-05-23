//
//  Storage.swift
//
//  Created by Emad Bayramy on 1/20/20.
//  Copyright © 2020 Emad Bayramy. All rights reserved.
//

import Foundation

@propertyWrapper
struct Storage<T: Codable> {
    
    struct Wrapper<T>: Codable where T : Codable {
        let wrapper: T
    }
    
    private let key: String
    private let defaultValue: T
    private let storage: UserDefaults = .standard
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            // Read value from UserDefaults
            guard let data = storage.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }
            
            // Convert data to the desire data type
            let value = try? JSONDecoder().decode(Wrapper<T>.self, from: data)
            return value?.wrapper ?? defaultValue
        }
        
        set {
            // Convert newValue to data
            do {
                let data = try JSONEncoder().encode(Wrapper(wrapper: newValue))
                storage.set(data, forKey: key)
            } catch {
                storage.removeObject(forKey: key)
                print(error)
            }
        }
    }
}

extension Storage where T: ExpressibleByNilLiteral {
    
    init(key: String) {
        self.init(key: key, defaultValue: nil)
    }
    
}

private protocol AnyOptional {
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
}
