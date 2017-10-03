//
//  ViewController.swift
//  Timer
//
//  Created by dly on 10/2/17.
//  Copyright © 2017 dly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Create an instance/object of the class Timer and instantiate
    var timer = Timer()
    
    var time = 60
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func pauseButtonPressed(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    @IBAction func playButtonPressed(_ sender: UIBarButtonItem) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(decreaseTimer), userInfo: nil, repeats: true)
        
        //timeInterval - ever 1 second, target - this ViewController, selector - what you want to do every one second? Run the func processTimer, userInfo - don't want to send any particular user info so set to nil, repeats - true, we want this to happen indefinitely or until a stop is specify.
    }
  
    @IBAction func minusSecondsButtonPressed(_ sender: UIBarButtonItem) {
        if time > 10 {
            time -= 10
            timerLabel.text = String(time)
        }
        
    }
    @IBAction func addSecondsButtonPressed(_ sender: UIBarButtonItem) {
        time += 10
        timerLabel.text = String(time)
    }
    @IBAction func resetButtonPressed(_ sender: UIBarButtonItem) {
        time = 60
        timerLabel.text = String(time)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "Timer"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Add '@objc' to expose this instance method to Objective-C
    @objc func decreaseTimer() {
        if time > 0 {
            time -= 1
            timerLabel.text = String(time)
        }else{
            timer.invalidate()
        }
    }
    

}

