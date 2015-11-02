//
//  Game.swift
//  Cross and Circle
//
//  Created by Nick on 10/31/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import UIKit

class Game: NSObject {
    var board = [[" "," "," "],
                [" "," "," "],
                [" "," "," "]]
    subscript(x:Int,y:Int)->GameState?{
        get{
            return nil
        }
        set(letter){
            var tic = "";
            if String(letter!) == "Cross" {
                tic = "X"
                // Check to see if cross has won
                // Start from current location [x][y]
                // Is [x-1][y] a cross?
                // Is [x+1][y] a cross?
                // Is [x][y-1] a cross?
                // Is [x][y+1] a cross?
                
                // Or... just check the whole graph (no edge cases)
                // [x][y] is it a cross?
                    // yes
                        // [x][y+1] is it a cross?
                            // yes
                            // no
                        // [x+1][y] is it a cross?
                            // yes
                            // no
                        // [x+1][y+1] is it a cross?
                            // yes
                            // no
                    // no
                // [][]
                
                // There's gotta be a better way!!!
            } else if String(letter!) == "Circle" {
                tic = "O"
                // Check to see if circle has won
            }
            board[y][x] = String(tic)
            for var i = 0; i < board.count; i++ {
                for var j = 0; j < board[i].count; j++ {
                    print(board[i][j], terminator:"")
                    if j == board[i].count {
                        print("")
                    }
                }
                print("")
            }
            print("")
        }
    }
}
