//
//  ContentView.swift
//  DevelopersApp
//
//  Created by Rami Ounifi on 28/7/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let cards: [Card] = cardData
    
    // MARK: - Content
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false)  {
            HStack (alignment: .center, spacing: 20){
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
        }
        .padding(20)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
