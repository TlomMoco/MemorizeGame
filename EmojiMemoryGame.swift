//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Trym Træen on 04/09/2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["🤑", "🫥", "👀", "🥴", "💩", "👻", "☠️", "😈", "👽", "👑", "😶‍🌫️", "🥶", "🫠", "🤩", "🫣", "🤦", "🙉", "🐮", "🦊", "🎩", "👶", "🖕", "🙇", "🐥"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){ pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
