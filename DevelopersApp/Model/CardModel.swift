//
//  CardModel.swift
//  DevelopersApp
//
//  Created by Rami Ounifi on 28/7/2021.
//

import SwiftUI

// MARK: - Card model
struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
