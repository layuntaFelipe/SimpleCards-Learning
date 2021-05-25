//
//  CardView.swift
//  SimpleCards
//
//  Created by Felipe Lobo on 25/05/21.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    var card: Card
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var feedback = UIImpactFeedbackGenerator(style: .heavy)
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .opacity(fadeIn ? 1.0 : 0.0)
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(y: moveDownward ? 0 : -50)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
                    .offset(y: moveDownward ? 0 : -50)
                
                Spacer()
            }//VSTACK
            .padding(.top)
            
            VStack{
                Spacer()
                Button(action: {
                    print("Button was tapped")
                    playSound(sound: "sound-chime", type: "mp3")
                    feedback.impactOccurred()
                    showAlert.toggle()
                }, label: {
                    HStack {
                        Text(card.callToAction.uppercased())
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .accentColor(.white)
                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 26, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 24)
                    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                    .offset(y: moveUpward ? 0 : 90)
                })
                .padding(.bottom, 30)
            }//VSTACK
        }//ZSTACK
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                moveDownward.toggle()
                moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        })
    }
}

//MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1])
            .previewLayout(.sizeThatFits)
    }
}
