//
//  ContentView.swift
//  STUWIRELESS Login
//
//  Created by Bean John on 26/3/2024.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject private var onboardingViewModel = OnboardingViewModel()
	
    var body: some View {
		VStack {
			Group {
				switch self.onboardingViewModel.currentStep {
					case .intro:
						IntroductionView()
					case .credentials:
						CredentialsView()
					case .done:
						DoneView()
				}
			}
			if self.onboardingViewModel.currentStep != .credentials {
				self.stepSwitcher
			}
		}
		.padding()
		.frame(maxWidth: 400, maxHeight: 300)
		.environmentObject(onboardingViewModel)
    }
	
	var stepSwitcher: some View {
		HStack {
			Button {
				self.onboardingViewModel.currentStep.prevStep()
			} label: {
				Text("Previous")
			}
			.disabled(!self.onboardingViewModel.currentStep.hasPrevStep)
			Button {
				self.onboardingViewModel.currentStep.nextStep()
			} label: {
				Text("Next")
			}
			.disabled(!self.onboardingViewModel.currentStep.hasNextStep)
		}
		.buttonStyle(.bordered)
		.controlSize(.large)
		.padding(.top)
	}
	
}

#Preview {
    ContentView()
}
