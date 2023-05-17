//
//  Art_GeneratorApp.swift
//  Art Generator
//
//  Created by Salima O. on 16/05/2023.
//

import SwiftUI

@main
struct AppEntry: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    Task {
                        let sample = GenerationInput(prompt: "Man in a rowboat in the ocean in a storm similar to work by Van Gogh")
                        if let data = sample.encodedData {
                            try await APIService().fetchImages(with: data)
                        }
                    }
                }
        }
    }
}
