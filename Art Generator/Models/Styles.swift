//
//  Styles.swift
//  Art Generator
//
//  Created by Salima O. on 19/05/2023.
//

import Foundation

enum ImageStyle: String, CaseIterable {
    case none
    case abstract = "abstract"
    case cartoon
    case comic
    case expressionism
    case impressionism
    case popArt = "pop Art"
    case realism
    case surrealism
  
    var description: String {
        self != .none ? "an image in the style of " + self.rawValue + " " : ""
    }
}


enum ImageMedium: String, CaseIterable {
    case none
    case digital = "digital art"
    case oil = "oil painting"
    case pastel
    case photo
    case spray = "spay print"
    case watercolor
    
    var description: String {
        self != .none ? "using the medium of " + self.rawValue + " " : ""
    }
}

enum Artist: String, CaseIterable {
    case none
    case dali = "Salvador Dali"
    case davinci = "Leonardo da Vinci"
    case matisse = "Henry Matisse"
    case monet = "Claude Monet"
    case picasso = "Pablo Picasso"
    case pollock = "Jackson Pollock"
    case vangogh = "Vincent van Gogh"
    case warhol = "Andy Warhol"
   
    var description: String {
        self != .none ? "similar to the works of " + self.rawValue + " " : ""
    }
}
