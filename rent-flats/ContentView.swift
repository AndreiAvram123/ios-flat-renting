//
//  ContentView.swift
//  rent-flats
//
//  Created by Andrei Avram on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(
                String(localized: "welcome_message"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
