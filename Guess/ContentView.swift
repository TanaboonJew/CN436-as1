//
//  ContentView.swift
//  Guess The Num
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 25/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess = 0
    @State var showScore = false
    @State var isMore = false
    @State var alwayTrue = false
    var body: some View {
        VStack {
            Text("Guess the right number 1 - 100")
            TextField("Input Number Here", value: $guess, formatter: NumberFormatter())
            Button("Guess") {
                game.check(guess: guess)
                if game.diff == 0 {
                    showScore = true
                }
                else {
                    isMore = game.isMore()
                }
                alwayTrue = true
            }
            .alert(isPresented: $alwayTrue) {
                if showScore {
                    return Alert(
                        title: Text("Your score is "),
                        message: Text(String(game.score)),
                        dismissButton: .default(Text("OK")) {
                            guess = 0
                            game.startNewGame()
                            showScore = false
                            isMore = false
                            alwayTrue = false
                        }
                    )
                }
                else if isMore {
                    return Alert(
                        title: Text("Your guess is too low"),
                        dismissButton: .default(Text("OK")) {}
                    )
                }
                else {
                    return Alert(
                        title: Text("Your guess is too high"),
                        dismissButton: .default(Text("OK")) {}
                    )
                }
            }
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
