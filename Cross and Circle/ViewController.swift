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
    
    var game_state = GameState.Circle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fieldTouched(sender: UIButton) {
        print(sender.tag)
        
        switch game_state {
        case .Circle:
            sender.setTitle("O", forState: UIControlState.Normal)
        case .Cross:
            sender.setTitle("X", forState: UIControlState.Normal)
        }
        
        game_state.next()
    }

}

