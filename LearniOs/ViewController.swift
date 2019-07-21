//
//  ViewController.swift
//  LearniOs
//
//  Created by IMCS2 on 7/18/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Declaring all the variable
    @IBOutlet weak var myToolBar: UIToolbar!
    var counter = 0.0
    //Timer is function which will update immediatly whever you want to update something
    var timer = Timer()
    //Initilaisation
    var isPlaying = false
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text =  String(counter)
        setOnPause()
        // Do any additional setup after loading the view.
    }
    
    
    //Rewinding the number of seconds
    @IBAction func rewindButtonTapped(_ sender: Any) {
        if (counter < 11){//If the rewind button is less than 11 then it sets to zero
            counter =  0.0
        }else{
            counter = counter - 10
        }
        timeLabel.text = String(counter)
    }
    
    
    //start button will help the stopwatch to start the seconds
    @IBAction func bttnStart(_ sender: Any) {
        //When the button is tapped it goes to the function and changes the icon shape to pause
        if !isPlaying{
            setOnPlay()
            //The timer counts up by one
            //Update timer function will help to increase the count by one
            timer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPlaying = true
        }else{
           //When the button is tapped again, it goes to the function and changes the icon shape to play
            setOnPause()
        }
    }
    
    
    //Forward button: When tapped at that point, it adds the value by 10
    @IBAction func fastForwardButtonTapped(_ sender: Any) {
        counter = counter + 10
        timeLabel.text = String(counter)
    }
    
    
    //function to change the button shape to play
    //play button appears when stop button is pressed
    func setOnPause(){
        // It is going to access the middle part of the tab bar which is stop button and convert it to the play button
        var items = self.myToolBar.items
        items![2] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(ViewController.bttnStart(_:)))
        self.myToolBar.setItems(items, animated: true)
        timer.invalidate()
        isPlaying = false
    }
    
    
    //function to change the button shape to pause
    //stop button appears when the play button is tapped
    func setOnPlay(){
        //It is going to access the play button in the tab bar and change it the pause button
        var items = self.myToolBar.items
        items![2] = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.pause, target: self, action: #selector(ViewController.bttnStart(_:)))
        isPlaying = true
        self.myToolBar.setItems(items, animated: true)
        timer.invalidate()
    }
    
    
    //Update timer will help to update the time by one second
    @objc func updateTimer(){
        counter =  counter + 1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    //When reset button is pressed, it sets the timer to zero
    @IBAction func resetTimer(_ sender: Any) {
        timer.invalidate()
        isPlaying = false
        counter =  0.0
        timeLabel.text = String(counter)
        setOnPause()
    }
    


}

