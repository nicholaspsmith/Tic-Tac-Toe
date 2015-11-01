//
//  ViewController.swift
//  Cross and Circle
//
//  Created by Nick on 10/29/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import UIKit

enum GameState{
    case Cross, Circle
    
    mutating func next() {
        switch self{
        case .Circle: self = .Cross
        case .Cross: self = .Circle
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var circleOutlet: UIButton!
    @IBOutlet weak var crossOutlet: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    
    var game_state = GameState.Circle
    var gameLogic = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.selectTurn()
        
        resetOutlet.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "resetClicked:"))
    }
    
    func resetClicked(gesturerecognizer:UITapGestureRecognizer){
        game_state = .Circle
        selectTurn()
        
        for sv in self.view.subviews {
            if sv.tag > 0 {
                (sv as! UIButton).setTitle(" ", forState: UIControlState.Normal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fieldTouched(sender: UIButton) {
        
        switch game_state {
        case .Circle:
            sender.setTitle("O", forState: UIControlState.Normal)
        case .Cross:
            sender.setTitle("X", forState: UIControlState.Normal)
        }
        
        let x = (sender.tag-1) % 3
        let y = (sender.tag-1) / 3
        
        gameLogic[x,y] = self.game_state
        
        game_state.next()
        self.selectTurn()
    }
    
    func selectTurn(){
        switch game_state {
        case .Circle:
            circleOutlet.selected = true
            crossOutlet.selected = false
        case .Cross:
            crossOutlet.selected = true
            circleOutlet.selected = false
        }
    }

}

