//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Mallika Miglani on 13/07/23.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var gameState = GameState()
    var body: some View
    {
        ZStack {
            Color(UIColor.systemGray6)
                .ignoresSafeArea()
        }
        .overlay
        {
            VStack{
                let borderSize = CGFloat(5)
                Text(String(format: "X's : %d", gameState.crossScore))
                    .font(.custom("TrebuchetMS-Bold", size: 30))
                    //.fontWeight(.light)
                    .foregroundColor(Color.mint)
                    .padding(0)
                    //.rotationEffect(.degrees(180))
                
                VStack(spacing: borderSize)
                {
                    ForEach(0...2, id: \.self)
                    {
                        row in
                        HStack(spacing: borderSize)
                        {
                            ForEach(0...2, id: \.self)
                            {
                                column in
                                let cell = gameState.board[row][column]
                                Text(cell.displayTile())
                                    .font(.system(size: 100))
                                    .foregroundColor(cell.tileColor())
                                    .bold()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .aspectRatio(1, contentMode: .fit)
                                    .background(Color(UIColor.systemGray6)) //light
                                    .onTapGesture {
                                        gameState.placeTile(row, column)
                                    }
                            }
                        }
                    }
                }
                .background(Color(UIColor.systemGray)) // dark
                .padding()
                .alert(isPresented: $gameState.showAlert)
                {
                    Alert(
                        title: Text(gameState.alertText),
                        dismissButton: .default(Text("Next game!"))
                        {
                            gameState.resetBoard()
                        }
                    )
                }
                Text(String(format: "O's : %d", gameState.dotScore))
                    .font(.custom("TrebuchetMS-Bold", size: 30))
                    .padding()
                    .foregroundColor(Color.pink)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
         ContentView()
    }
}
