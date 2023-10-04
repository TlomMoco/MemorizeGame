//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Trym Træen on 31/08/2023.
//

import SwiftUI



struct EmojiMemoryGameView: View {
    
    // The ContentView needs to be able to see the model so it can give out
    // a UI that sees the model:
    @ObservedObject var viewModel: EmojiMemoryGame
    
    // emojis[0..<emojiCount] /* ... = range from 0 to (and included) 6 ..< = up to 6 */
    
    // Swift vet at [""] er det samme som Array<String>
    
    @State var emojiCount = 20
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards){ card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding()
        
    }
}


struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    // var content: String
    // @State var isFaceUp: Bool = true
    // @State Turns this variable to a pointer
    // that points to another boolean value in memory
    // SJEKK FORKLARING PÅ State

    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)

            } else if card.isMatched {
                shape.opacity(0)
            }
            
            else {
                shape.fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}

