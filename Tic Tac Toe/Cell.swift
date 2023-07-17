//
//  Cell.swift
//  Tic Tac Toe
//
//  Created by Mallika Miglani on 13/07/23.
//

import Foundation

import SwiftUI

struct Cell
{
    var tile: Tile

    func displayTile() -> String
    {
        switch(tile)
        {
            case Tile.Cross:
                return "X"
            case Tile.Dot:
                return "O"
            default:
                return ""
        }

    }

    func tileColor() -> Color
    {
        switch(tile)
        {
            case Tile.Cross:
                return Color.mint
            case Tile.Dot:
                return Color.pink
            default:
                return Color.white
        }
        
    }
}

enum Tile
{
    case Cross
    case Dot
    case Empty
}
