//
//  PunsViewController.swift
//  ikid
//
//  Created by Saurav Sawansukha on 5/4/21.
//

import UIKit

class PunsViewController: UIViewController {

    var dadJokesPunch: PunsQuestion! = nil
    var theRealPunch: PunsAnswer! = nil
    var counter1: Int = 1

//    var mainDad: DadJokesViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        firstBuilder()
//        secondBuilder()

        switchViewController(nil, to : dadJokesPunch)
        
        // Do any additional setup aftwer loading the view.
    }
    

    @IBAction func flipPunJoke(_ sender: Any) {
        firstBuilder()
        secondBuilder()
        NSLog("flip was pushed")
//
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if dadJokesPunch != nil &&
            dadJokesPunch?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            theRealPunch.view.frame = view.frame
            switchViewController(dadJokesPunch, to: theRealPunch)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadJokesPunch.view.frame = view.frame
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

    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}