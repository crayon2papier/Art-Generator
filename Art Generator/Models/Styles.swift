//
//  Styles.swift
//  Art Generator
//
//  Created by Salima O. on 19/05/2023.
//

import Foundation

enum ImageStyle: String, CaseIterable {
    case aucun = "aucune"
    case blanc = "blanche"
    case noir
    case pourpre
    case rouge
    case orange
    case jaune
    case vert
    case bleu
    case violet = "violette"
    case ivoire
    case crème
    case beige
    case rose
    case kaki
    case brun
    case marron
    case bordeaux
  
    var description: String {
        self != .aucun ? "avec une couleur " + self.rawValue + " " : ""
    }
}


enum ImageMedium: String, CaseIterable {
    case none = "aucune"
    case pale = "pâle"
    case gris = "grisé"
    case sombre
    case clair
    case moyen
    case foncé
    case vif
    case intense
    case profond
    
    var description: String {
        self != .none ? "" + self.rawValue + " " : ""
    }
}

enum Artist: String, CaseIterable {
    case none = "aucun"
    case symbole = "Mot symbole"
    case lettre = "Logo avec lettres"
    case monogramme = "Monogramme"
    case pictogramme = "Pictogramme"
    case abstrait = "Abstrait"
    case mascotte = "Mascotte"
    case embleme = "Emblème"
    case combinaison = "Combinaison Logo"
    
   
    var description: String {
        self != .none ? "avec pour type de logo " + self.rawValue + " " : ""
    }
}

enum Style: String, CaseIterable {
    case none = "aucun"
    case mixte
    case arrondis
    case creatif = "créatif"
    case elegant = "élégant"
    case futuriste
    case gras
    case xxl = "XXL"
    
    var description: String {
        self != .none ? "avec un style " + self.rawValue + " " : ""
    }
}
