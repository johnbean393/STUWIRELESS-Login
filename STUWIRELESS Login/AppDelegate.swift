//
//  AppDelegate.swift
//  STUWIRELESS Login
//
//  Created by Bean John on 27/3/2024.
//

import Foundation
import AppKit
import LaunchAtLogin

class AppDelegate: NSObject, NSApplicationDelegate {
	
	func applicationDidFinishLaunching(_ notification: Notification) {
		if !LaunchAtLogin.isEnabled {
			LaunchAtLogin.isEnabled = true
		}
		setupNotificationHandlers()
	}
	
	func setupNotificationHandlers() {
		[
			NSWorkspace.didWakeNotification: #selector(onPowerUp(note:))
		].forEach { notification, sel in
			NSWorkspace.shared.notificationCenter.addObserver(self, selector: sel, name: notification, object: nil)
		}
		
	}
	
	@objc func onPowerUp(note: NSNotification) {
		WakeDelegate.loginToStuWireless()
	}
	
}
