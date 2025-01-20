//
//  DoneView.swift
//  STUWIRELESS Login
//
//  Created by John Bean on 1/20/25.
//

import SwiftUI

struct DoneView: View {
	
    var body: some View {
		VStack {
			HStack {
				VStack {
					Image(systemName: "checkmark.circle.fill")
						.resizable()
						.frame(width: 60, height: 60)
						.foregroundColor(.green)
						.imageScale(.large)
					Text("**Setup Complete**")
						.font(.largeTitle)
					Text("This app will automatically log you into STUWIRELESS when your Mac wakes from sleep. **You can now close this window.**")
						.font(.title3)
						.multilineTextAlignment(.leading)
						.fixedSize(horizontal: false, vertical: true)
				}
				Divider()
				Button("Manual Login") {
					WakeDelegate.loginToStuWireless()
				}
				.keyboardShortcut(.defaultAction)
				.buttonStyle(.bordered)
				.controlSize(.large)
			}
			Divider()
		}
    }
	
}

#Preview {
    DoneView()
}
