//
//  CredentialsView.swift
//  STUWIRELESS Login
//
//  Created by Bean John on 27/3/2024.
//

import SwiftUI

struct CredentialsView: View {
	
	@AppStorage("username") var username: String = ""
	@AppStorage("password") var password: String = ""
	
	@State private var showPassword: Bool = false
	
	var body: some View {
		GroupBox {
			VStack {
				usernameField
				passwordField
				HStack {
					Button("Save") {
						UserDefaults.standard.setValue(username, forKey: "username")
						UserDefaults.standard.setValue(password, forKey: "password")
					}
					Button("Login") {
						WakeDelegate.loginToStuWireless()
					}
					.keyboardShortcut(.defaultAction)
				}
			}
			.padding()
			.textFieldStyle(.roundedBorder)
		}
	}
	
	var usernameField: some View {
		HStack {
			Text("Username: ")
			TextField("Username", text: $username)
				.onChange(of: username) { _ in
					UserDefaults.standard.setValue(username, forKey: "username")
				}
		}
	}
	
	var passwordField: some View {
		HStack {
			Text("Password: ")
			Group {
				if !showPassword {
					SecureField("Password", text: $password)
				} else {
					TextField("Password", text: $password)
				}
			}
			.onChange(of: password) { _ in
				UserDefaults.standard.setValue(password, forKey: "password")
			}
			Toggle("Show", isOn: $showPassword)
				.toggleStyle(.switch)
		}
	}
	
}

#Preview {
    CredentialsView()
}
