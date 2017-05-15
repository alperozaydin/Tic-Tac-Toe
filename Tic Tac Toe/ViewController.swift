//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Alper on 7/28/16.
//  Copyright © 2016 Alper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    // 1 nought, 2 cross
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameActive = true

    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgainPressed(_ sender: AnyObject) {
        
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        gameActive = true
        
        var button : UIButton
        
        for tags in 0...8{
            
            button = view.viewWithTag(tags) as! UIButton
            
            button.setImage(nil, for: UIControlState())
            
        }
        
        myLabel.isHidden = true
        playAgainButton.isHidden = true
        myLabel.alpha = 0
        playAgainButton.alpha = 0
        
    }
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        
        
        if gameState[sender.tag] == 0 && gameActive == true{
            
            var image = UIImage()
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1{
                
                image = UIImage(named: "nought.png")!
                
                activePlayer = 2
                
            }
            else{
                
                image = UIImage(named: "cross.png")!
                
                activePlayer = 1
                
            }
            
            sender.setImage(image, for: UIControlState())
            
            for combinations in winningCombinations{
                
                if  gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] {
                    
                    gameActive = false
                    
                    if activePlayer == 1 {
                        
                        myLabel.text = "Crosses has won!"
                        
                    }
                    else{
                        
                        myLabel.text = "Noughts has won!"
                    }
                    
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        self.myLabel.isHidden = false
                        self.playAgainButton.isHidden = false
                        self.myLabel.alpha = 1
                        self.playAgainButton.alpha = 1
                        
                    }) 
                    
                }
                
            }
            if gameState[0] != 0 && gameState[1] != 0 && gameState[2] != 0 && gameState[3] != 0 && gameState[4] != 0 && gameState[5] != 0 && gameState[6] != 0 && gameState[7] != 0 && gameState[8] != 0 {
                
                gameActive = false
                
                myLabel.text = "A tie!"
                UIView.animate(withDuration: 0.5, animations: {
                    self.myLabel.isHidden = false
                    self.playAgainButton.isHidden = false
                    self.myLabel.alpha = 1
                    self.playAgainButton.alpha = 1
                    
                }) 
                
            }

        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.isHidden = true
        playAgainButton.isHidden = true
        myLabel.alpha = 0
        playAgainButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        
        
        
    }

}

