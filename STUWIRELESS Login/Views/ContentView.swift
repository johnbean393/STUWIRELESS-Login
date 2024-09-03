//
//  ContentView.swift
//  STUWIRELESS Login
//
//  Created by Bean John on 26/3/2024.
//

import SwiftUI

struct ContentView: View {
	
    var body: some View {
		VStack {
			Text("This app will log you into STUWIRELESS when it wakes from sleep")
				.font(.title3)
				.bold()
			CredentialsLoggingView()
		}
		.padding()
		.frame(width: 600)
    }
	
}

#Preview {
    ContentView()
}
