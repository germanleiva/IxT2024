//
//  ContentView.swift
//  Lecture8
//
//  Created by Vittoria Frau on 05/11/2024.
//

import SwiftUI

struct ContentView: View {
    let columnsGrid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columnsGrid) {
                    ForEach(MockData.frameworks, id: \.name){
                        eachFramework in
                        NavigationLink(value: eachFramework){
                            FrameworkTitleView(name: eachFramework.name, image: eachFramework.imageName)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Apple Frameworks")
            .navigationDestination(for: Framework.self) {
                eachFramework in
                FrameworkDetailView(clickedFramework: eachFramework)
            }
        }
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

struct FrameworkTitleView: View {
    var name : String
    var image : String
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 90, height: 90)
            Text(name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
    }
}
