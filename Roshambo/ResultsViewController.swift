//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Ceasar Barbosa on 4/11/16.
//  Copyright © 2016 Ceasar Barbosa. All rights reserved.
//

import UIKit

enum Choice: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func randomChoice() -> Choice {
        let choices = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        
        return Choice(rawValue: choices[randomChoice])!
    }
    
}

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultsLabel: UILabel!
    @IBOutlet var resultsImage: UIImageView!
    
    var userChoice: Choice!
    let opponentChoice: Choice = Choice.randomChoice()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        displayResults()
    }
    
    func displayResults() {
        
        var imageName: String
        var text: String
        let matchUp = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        switch(userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchUp). Its a tie!"
            imageName = "itsATie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "\(matchUp). You Win!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
            
        default:
            text = "\(matchUp). You Lose..."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
            
        }
        
        imageName = imageName.lowercaseString
        resultsLabel.text = text
        resultsImage.image = UIImage(named: imageName)
        
    }
    
    
    
    
    
    
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
