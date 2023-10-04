//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Trym Træen on 31/08/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
