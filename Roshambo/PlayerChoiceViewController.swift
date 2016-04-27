//
//  PlayerChoiceViewController.swift
//  Roshambo
//
//  Created by Ceasar Barbosa on 4/11/16.
//  Copyright © 2016 Ceasar Barbosa. All rights reserved.
//

import UIKit

class PlayerChoiceViewController: UIViewController {
    
    @IBAction func playRock(sender: UIButton) {
        let resultsViewController = self.storyboard?.instantiateViewControllerWithIdentifier("resultsVC") as! ResultsViewController
        
        resultsViewController.userChoice = getUserShape(sender)
        
        self.presentViewController(resultsViewController, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(sender: UIButton) {
        performSegueWithIdentifier("resultsSegue", sender: sender)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "resultsSegue" {
            let resultsViewController = segue.destinationViewController as! ResultsViewController
            resultsViewController.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    func getUserShape(sender: UIButton) -> Choice {
        let shape = sender.titleForState(.Normal)!
        return Choice(rawValue: shape)!
    }
    

    
    
}
