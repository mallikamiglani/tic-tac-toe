//
//  GameState.swift
//  Tic Tac Toe
//
//  Created by Mallika Miglani on 13/07/23.
//

import Foundation

import SwiftUI

class GameState: ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var dotScore = 0
    @Published var crossScore = 0
    @Published var alertText = ""
    @Published var showAlert = false
    
    init()
    {
        resetBoard()
    }
    
    func resetBoard()
    {
        var newBoard = [[Cell]]()
        for _ in 0...2
        {
            var row = [Cell]()
            for _ in 0...2
            {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
    
    func placeTile(_ row: Int, _ column: Int)
    {
        if (board[row][column].tile != Tile.Empty)
        {
            return
        }
        
        board[row][column].tile = turn
        
        if (checkVictory())
        {   var winner = ""
            if turn == Tile.Cross
            {
                crossScore += 1
                winner = "X's"
            }
            else
            {
                dotScore += 1
                winner = "O's"
            }
            
            alertText = winner + " win!"
            showAlert = true
        }
        else{
            turn = turn == Tile.Cross ? Tile.Dot : Tile.Cross
            if (checkDraw())
            {
                alertText = "It's a draw!"
                showAlert = true
            }
        }
    }
    
    func checkDraw() -> Bool
    {
        for row in board
        {
            for cell in row
            {
                if (cell.tile == Tile.Empty)
                {
                    return false
                }
            }
        }
        return true
    }
    
    func checkVictory() -> Bool
    {
        
        for i in 0...2
        {
            // rows victory
            if (board[i][0].tile == board[i][1].tile
                && board[i][0].tile == board[i][2].tile
                && board[i][0].tile != Tile.Empty)
            {
                return true
            }
            
            // col victory
            if (board[0][i].tile == board[1][i].tile
                && board[0][i].tile == board[2][i].tile
                && board[0][i].tile != Tile.Empty)
            {
                return true
            }
        }
        
        if (board[0][0].tile == board[1][1].tile
            && board[0][0].tile == board[2][2].tile
            && board[0][0].tile != Tile.Empty)
        {
            return true
        }
        
        if (board[0][2].tile == board[1][1].tile
            && board[0][2].tile == board[2][0].tile
            && board[0][2].tile != Tile.Empty)
        {
            return true
        }
        
        return false
    }
        
}
