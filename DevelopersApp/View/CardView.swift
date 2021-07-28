//
//  CardView.swift
//  DevelopersApp
//
//  Created by Rami Ounifi on 28/7/2021.
//

import SwiftUI

struct CardView: View {
    // MARK: - Properties
    
    var card: Card
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    // MARK: - Card
    var body: some View {
        ZStack {
            CardImage()
            VStack {
                
                CardTitle()
                CardHeadline()
            }
            .offset(y: moveDownward ? -218 : -300)
            CustomButton(
                colors: card.gradientColors,
                textToDisplay: card.callToAction,
                showAlert: showAlert
            )
            .offset(y: moveUpward ? 210 : 300)
            
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(card.title),
                  message: Text(card.message), dismissButton: .default(Text("OK")))
        })
    }
    
    @ViewBuilder private func CardImage() -> some View {
        Image(card.imageName)
            .opacity(fadeIn ? 1.0 : 0.0)
    }
    
    @ViewBuilder private func CardTitle() -> some View {
        Text(card.title)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder private func CardHeadline() -> some View {
        Text(card.headline)
            .fontWeight(.light)
            .foregroundColor(.white)
            .italic()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView( card: cardData[1])
            .previewLayout(.sizeThatFits)
    }
}
