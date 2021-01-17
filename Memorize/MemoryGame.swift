//
//  MemoryGame.swift
//  Memorize
//
//  Created by Banashri Mandal on 12.01.21.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable { // Model
    var cards : Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("Card is chosen: \(card)")
        
        if let chosenCardIndex: Int = cards.firstIndex(matching: card), !cards[chosenCardIndex].isFaceUp, !cards[chosenCardIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenCardIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenCardIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenCardIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenCardIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
