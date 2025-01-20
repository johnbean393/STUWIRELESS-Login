//
//  CredentialsView.swift
//  STUWIRELESS Login
//
//  Created by Bean John on 27/3/2024.
//

import SwiftUI

struct CredentialsView: View {
	
	@EnvironmentObject private var onboardingViewModel: OnboardingViewModel
	
	@AppStorage("username") var username: String = ""
	@AppStorage("password") var password: String = ""
	
	var isDone: Bool { !username.isEmpty && !password.isEmpty }
	
	var body: some View {
		VStack {
			Form {
				Section {
					usernameField
					passwordField
				} header: {
					Text("Login Credentials")
				}
			}
			.formStyle(.grouped)
			prevAndNextButton
		}
		.textFieldStyle(.roundedBorder)
		.frame(
			minWidth: 400,
			minHeight: 200
		)
	}
	
	var usernameField: some View {
		TextField("Username", text: $username)
			.onChange(of: username) { _ in
				UserDefaults.standard.setValue(username, forKey: "username")
			}
	}
	
	var passwordField: some View {
		SecureField("Password", text: $password)
			.onChange(of: password) { _ in
				UserDefaults.standard.setValue(password, forKey: "password")
			}
	}
	
	var prevAndNextButton: some View {
		HStack {
			Button("Previous") {
				self.onboardingViewModel.currentStep.prevStep()
			}
			Button("Next") {
				if isDone {
					UserDefaults.standard.setValue(
						username,
						forKey: "username"
					)
					UserDefaults.standard.setValue(
						password,
						forKey: "password"
					)
					self.onboardingViewModel.currentStep.nextStep()
					// Mark as setup
					UserDefaults.standard.set(true, forKey: "didSetUp")
				}
			}
		}
		.buttonStyle(.bordered)
		.controlSize(.large)
		.padding(.top)
	}
	
}

#Preview {
    CredentialsView()
}
