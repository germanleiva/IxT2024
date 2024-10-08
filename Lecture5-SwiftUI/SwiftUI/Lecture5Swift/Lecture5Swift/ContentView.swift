//
//  ContentView.swift
//  Lecture5Swift
//
//  Created by Vittoria Frau on 08/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            EditButton()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
