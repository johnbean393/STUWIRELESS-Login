//
//  OnboardingViewModel.swift
//  STUWIRELESS Login
//
//  Created by John Bean on 1/20/25.
//

import Foundation
import SwiftUI

public class OnboardingViewModel: ObservableObject {

	@Published public var currentStep: Step = {
		// If no value
		if !UserDefaults.standard.exists(key: "didSetUp") {
			// Go to intro screen
			return .intro
		}
		if UserDefaults.standard.bool(
			forKey: "didSetUp"
		) {
			// If did set up, show done screen
			return .done
		}
		// Fall back to intro screen
		return .intro
	}()
	
	public enum Step: CaseIterable {
		
		case intro
		case credentials
		case done
		
		/// An array of ``Step`` indicating a sequence of steps
		public static var sequence: [Step] {
			return (Self.allCases + Self.allCases)
		}
		
		/// An `Int` representing the step's number
		public var progress: Int {
			return Self.sequence.firstIndex(of: self) ?? 0
		}
		
		/// A `Bool` indicating if there is a previous step
		public var hasPrevStep: Bool {
			return self.progress > 0
		}
		
		/// A `Bool` indicating if there is a next step
		public var hasNextStep: Bool {
			return self.progress < (Self.allCases.count - 1)
		}
		
		/// A function to switch to the next step
		public mutating func nextStep() {
			withAnimation(.linear) {
				self = Self.sequence[self.progress + 1]
			}
		}
		
		/// A function to switch to the previous step
		public mutating func prevStep() {
			let stepNumber: Int = Self.sequence.lastIndex(of: self) ?? 0
			withAnimation(.linear) {
				self = Self.sequence[stepNumber - 1]
			}
		}
		
	}
	
}
