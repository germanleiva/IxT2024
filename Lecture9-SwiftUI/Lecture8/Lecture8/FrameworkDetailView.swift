//
//  FrameworkDetailView.swift
//  Lecture8
//
//  Created by Vittoria Frau on 12/11/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    var clickedFramework : Framework
    
    var body: some View {
        VStack{
            DetailView(imageName: clickedFramework.imageName,
                       title: clickedFramework.name,
                       description: clickedFramework.description)
        }
        
        
    }
}

#Preview {
    FrameworkDetailView(clickedFramework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}

struct DetailView: View {
    var imageName : String
    var title : String
    var description : String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
            Text(description)
                .font(.body)
                .padding()
        }
    }
}
