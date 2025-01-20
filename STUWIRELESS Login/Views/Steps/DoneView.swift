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
				Text("This app will automatically log you into STUWIRELESS when your Mac wakes from sleep.")
					.font(.title3)
					.bold()
					.multilineTextAlignment(.leading)
					.fixedSize(horizontal: false, vertical: true)
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
