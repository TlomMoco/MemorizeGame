//
//  MemoryGame.swift
//  Memorize
//
//  Created by Trym Træen on 04/09/2023.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card){
        
        // if let chosenIndex = index(of: card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            // if let kjører ikke dersom indexOfTheOneA.. er nil.
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                // Hvis indexOfTheOneA.. er nil ->
                // setter vi først alle kortene til isFaceUp = false (kortene er røde)
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                // deretter deklarerer vi indexOfTheO.. til chosenIndex
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            // til slutt flipper chosenIndex kortet ved å toggle isFaceUp til true
            cards[chosenIndex].isFaceUp.toggle()
        }
        // print("ChosenCard = \(cards)")
    }

/*
 Koden over erstatter denne funksjonen:
 
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
*/
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}
