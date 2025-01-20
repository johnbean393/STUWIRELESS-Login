//
//  IntroductionView.swift
//  STUWIRELESS Login
//
//  Created by John Bean on 1/20/25.
//

import SwiftUI

struct IntroductionView: View {
	
    var body: some View {
		Text("Welcome to STUWIRELESS Login. Please follow the instructions to setup auto login.")
			.font(.title3)
			.bold()
			.multilineTextAlignment(.leading)
			.fixedSize(horizontal: false, vertical: true)
    }
	
}

#Preview {
    IntroductionView()
}
