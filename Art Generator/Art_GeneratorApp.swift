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
                    print(Bundle.main.infoDictionary?["API_KEY"] as? String)
                }
        }
    }
}
