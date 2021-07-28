//
//  CustomButton.swift
//  DevelopersApp
//
//  Created by Rami Ounifi on 28/7/2021.
//

import SwiftUI

struct CustomButton: View {
    let colors: [Color]
    let textToDisplay: String
    @State var showAlert: Bool
    var body: some View {
        Button(action: {
            playsound(sound: soundName, type: soundType)
            hapticImpact.impactOccurred()
            self.showAlert.toggle()
        }, label: {
            ButtonLabel()
        })
    }
    
    
    @ViewBuilder private func ButtonLabel() -> some View {
        HStack {
            ButtonLabelText()
            
            ButtonLabelImage()
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
        .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule())
        .shadow(
            color: Color(colorShadow),
            radius: 6,
            x: 0,
            y: 3
        )
    }
    
    @ViewBuilder private func ButtonLabelText() -> some View {
        Text(textToDisplay.uppercased())
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .accentColor(.white)
    }
    
    @ViewBuilder private func ButtonLabelImage() -> some View {
        Image(systemName: arrowIcon)
            .font(.title.weight(.medium))
            .accentColor(.white)
    }
    
}


struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(colors: [.pink, .white], textToDisplay: "", showAlert: false)
    }
}
