//
//  ContentView.swift
//  SimpleCards
//
//  Created by Felipe Lobo on 25/05/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    var cards: [Card] = cardData

    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20){
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }
            .padding(27)
        }
    }
}
//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
