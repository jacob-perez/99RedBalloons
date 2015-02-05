//
//  ViewController.swift
//  99RedBalloon
//
//  Created by Jacob Perez on 2/1/15.
//  Copyright (c) 2015 Jacob Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfBalloonsLabel: UILabel!
    @IBOutlet weak var imageOfBalloon: UIImageView!
    
    //Create an array, myBalloons of struct Balloon with "image"
    var myBalloons:[Balloon] = []
    
    //
    var currentImageIndex = 0
    
    //
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var openingImage = Balloon()
        openingImage.image = UIImage(named: "BerlinTVTower.jpg")
        
        var firstImage = Balloon()
        firstImage.image = UIImage(named: "RedBalloon1.jpg")
        
        var secondImage = Balloon()
        secondImage.image = UIImage(named: "RedBalloon2.jpg")
        
        var thirdImage = Balloon()
        thirdImage.image = UIImage(named: "RedBalloon3.jpg")
        
        var fourthImage = Balloon()
        fourthImage.image = UIImage(named: "RedBalloon4.jpg")
        
        
         // Load BerlinTVTower.jpg into imageOfBalloon
       imageOfBalloon.image = openingImage.image
        
        numberOfBalloonsLabel.text = ("There are \(currentIndex) balloons.")
        
         // Add all instances to the myBalloons array
        self.myBalloons += [firstImage, secondImage, thirdImage, fourthImage]
        
}
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        var randomImageIndex:Int
    
        // pull a number dependent on the count of balloon images in the array
        // DO loop below will run until the two are NOT equal
        do {
            randomImageIndex = Int(arc4random_uniform(UInt32(myBalloons.count)))
            println ("The randomImageIndex is \(randomImageIndex)")
        }
            while currentImageIndex == randomImageIndex
        
        // assign the random to the current
        self.currentImageIndex = randomImageIndex
        println ("The currentImageIndex is \(currentImageIndex)")
        
        
        var randomIndex:Int
        
        // pull a random number less than 100 for the numberOfBalloonsLabel
        // DO loop below will run until the two are NOT equal
        do {
            randomIndex = Int(arc4random_uniform(UInt32(99)))
            
        // println the randomIndex integer
            println ("The randomIndex is \(randomIndex)")

            randomIndex++
        // check to see if randomIndex is increased by 1 to never get "0 balloons"
            println ("The randomIndex plus 1 is \(randomIndex)")
        }
            while currentIndex == randomIndex

        
        // assign the random to the current
        self.currentIndex = randomIndex
        
        // check the currentIndex integer
        println ("The currentIndex for the string is \(currentIndex)")

        
        // Creates a transition between each balloon instance
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            let balloonImage = self.myBalloons[self.currentImageIndex]
            self.imageOfBalloon.image = balloonImage.image
            
            self.numberOfBalloonsLabel.text = ("There are \(self.currentIndex) balloons.")
            
            }, completion: { (finished: Bool) ->() in })

        
    }

}

