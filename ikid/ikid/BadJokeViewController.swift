//
//  BadJokeViewController.swift
//  ikid
//
//  Created by Saurav Sawansukha on 5/4/21.
//

import UIKit

class BadJokeViewController: UIViewController {

    @IBOutlet weak var joke: UILabel!
    var dadJokesPunch: BadQuestions! = nil
    var theRealPunch: BadAnswer! = nil
    var counter1: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


    @IBAction func flipBadJoke(_ sender: UIButton) {
        
            firstBuilder()
            secondBuilder()
            NSLog("flip was pushed")

            UIView.beginAnimations("View Flip", context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationCurve(.easeInOut)
            
            if dadJokesPunch != nil &&
                dadJokesPunch?.view.superview != nil {
                
                UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
                theRealPunch.view.frame = view.frame
                joke.text = "Why was the math teacher late to work?"
                switchViewController(dadJokesPunch, to: theRealPunch)
                
            } else {
                
                UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
                dadJokesPunch.view.frame = view.frame
                joke.text = "She took the rhombus."
                switchViewController(theRealPunch, to: dadJokesPunch)
                
            }
            

            UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
            if from != nil {
                from!.willMove(toParent: nil)
                from!.view.removeFromSuperview()
                from!.removeFromParent()
            }

            if to != nil {
                self.addChild(to!)
                self.view.insertSubview(to!.view, at: 0)
                to!.didMove(toParent: self)
            }
        }

    fileprivate func firstBuilder() {
         if dadJokesPunch == nil {
             dadJokesPunch =
                 storyboard?
                     .instantiateViewController(withIdentifier: "badQuestions") as! BadQuestions
         }
    }
    
    fileprivate func secondBuilder() {
        if theRealPunch == nil {
            theRealPunch =
                storyboard?
                    .instantiateViewController(withIdentifier: "badAnswer") as! BadAnswer
        }
    }
}
