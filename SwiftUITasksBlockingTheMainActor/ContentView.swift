//
//  ContentView.swift
//  SwiftUITasksBlockingTheMainActor
//
//  Created by Ramill Ibragimov on 15.03.2024.
//

import SwiftUI

@MainActor
struct ContentView: View {
    @State private var appModel = AppModel()
    
    var body: some View {
        VStack {
            Button("Count", action: appModel.count)
                .buttonStyle(.borderedProminent)
            
            Text(appModel.counter.formatted())
                .fontDesign(.monospaced)
                .font(.largeTitle)
            
            Text("Running: \(appModel.running ? "Yes" : "No")")
        }
        .task {
            await appModel.start()
        }
    }
}

#Preview {
    ContentView()
}
