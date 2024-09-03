//
//  STUWIRELESS_LoginApp.swift
//  STUWIRELESS Login
//
//  Created by Bean John on 26/3/2024.
//

import SwiftUI
import ExtensionKit

@main
struct STUWIRELESS_LoginApp: App {
	
	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.windowResizabilityContentSize()
		.windowStyle(.hiddenTitleBar)
    }
}
