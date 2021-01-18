//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Banashri Mandal on 12.01.21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😀", "🥰", "👻", "🎃"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in  return emojis[pairIndex] }
    }
    
    // MARK: - Access to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK : - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
