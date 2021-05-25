//
//  CardModel.swift
//  SimpleCards
//
//  Created by Felipe Lobo on 25/05/21.
//

import SwiftUI

//MARK: - CARD MODEL

struct Card: Identifiable {
    var id: UUID = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
