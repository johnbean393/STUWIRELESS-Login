//
//  WakeDelegate.swift
//  STUWIRELESS Login
//
//  Created by Bean John on 27/3/2024.
//

import Foundation
import Sjauth

class WakeDelegate {
	
	static func loginToStuWireless() {
		do {
			if let username = UserDefaults.standard.string(forKey: "username"),
			   let password = UserDefaults.standard.string(forKey: "password") {
				try Sjauth.login(url: "http://sjauth.ykpaoschool.cn/ac_portal/login.php", username: username, password: password)
				try Sjauth.login(url: "https://sjauth.ykpaoschool.cn:444/ac_portal/login.php", username: username, password: password)
			}
			print("Success")
		} catch {
			print(error)
		}
	}
	
}
