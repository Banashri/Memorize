//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Banashri Mandal on 11.01.21.
//

import SwiftUI

struct EmojiMemoryGameView: View { // Reflects the current state of the model
    
    @ObservedObject var viewModel: EmojiMemoryGame = EmojiMemoryGame()// View Model
    
    var body: some View {
        
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(5)
        }
            .padding()
            .foregroundColor(.orange)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
            
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: Drawing constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.75
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * fontScaleFactor
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
