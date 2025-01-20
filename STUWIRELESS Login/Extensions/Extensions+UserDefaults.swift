//
//  Extensions+UserDefaults.swift
//  STUWIRELESS Login
//
//  Created by John Bean on 1/20/25.
//

import Foundation

public extension UserDefaults {
	
	/// Function to check if a key exists
	func exists(key: String) -> Bool {
		return UserDefaults.standard.object(forKey: key) != nil
	}
	
}

