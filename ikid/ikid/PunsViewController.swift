//
//  PunsViewController.swift
//  ikid
//
//  Created by Saurav Sawansukha on 5/4/21.
//

import UIKit

class PunsViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
    var dadJokesPunch: PunsQuestion! = nil
    var theRealPunch: PunsAnswer! = nil
    var counter1: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        

        switchViewController(nil, to : dadJokesPunch)
        
    }
    

    @IBAction func flipPunJoke(_ sender: Any) {
        firstBuilder()
        secondBuilder()

        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if dadJokesPunch != nil &&
            dadJokesPunch?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            theRealPunch.view.frame = view.frame
            jokeLabel.text = "What do you call the wife of a hippie?"
            switchViewController(dadJokesPunch, to: theRealPunch)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadJokesPunch.view.frame = view.frame
            jokeLabel.text = "A Mississippi!"
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
                     .instantiateViewController(withIdentifier: "punsQuestion") as! PunsQuestion
         }
    }
    
    fileprivate func secondBuilder() {
        if theRealPunch == nil {
            theRealPunch =
                storyboard?
                    .instantiateViewController(withIdentifier: "punsAnswer") as? PunsAnswer
        }
    }
}
