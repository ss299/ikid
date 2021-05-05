//
//  DadJokesViewController.swift
//  ikid
//
//  Created by Saurav Sawansukha on 5/4/21.
//

import UIKit

class DadJokesViewController: UIViewController {
    
    var dadJokesPunch: DadJokesPunchLine! = nil
    var theRealPunch: RealPunchViewController! = nil
    var counter1: Int = 1
    @IBOutlet weak var dadJokeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switchViewController(nil, to : dadJokesPunch)
        
    }
    

    @IBAction func flipDadJoke(_ sender: UIButton) {
        firstBuilder()
        secondBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if dadJokesPunch != nil &&
            dadJokesPunch?.view.superview != nil {
            
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            theRealPunch.view.frame = view.frame
            dadJokeText.text = "What’s an astronaut’s favorite part of a computer?"
            switchViewController(dadJokesPunch, to: theRealPunch)
            
        } else {
            
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadJokesPunch.view.frame = view.frame
            dadJokeText.text = "The space bar."
            
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
                     .instantiateViewController(withIdentifier: "PunchLine")
                 as! DadJokesPunchLine
         }
    }
    
    fileprivate func secondBuilder() {
        if theRealPunch == nil {
            theRealPunch =
                storyboard?
                    .instantiateViewController(withIdentifier: "realPunch")
                as! RealPunchViewController
        }
    }
}
