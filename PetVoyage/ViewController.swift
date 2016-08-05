//
//  ViewController.swift
//  PetVoyage
//
//  Created by iOess on 8/4/16.
//  Copyright © 2016 iOess. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var animal: UIImageView!
    // create an array of animal image named "animals"
    let animals: Array<String> = ["cat", "cow", "penguin", "dog"]
    var currentAnimalIndex = 0
    
    @IBOutlet weak var background: UIImageView!
    // create an array of background images named "backgrounds"
    let backgrounds: Array<String> = ["paris", "beach", "forest", "new_york"]
    var currentBackgroundIndex = 0

    @IBAction func tapAnimal(sender: UITapGestureRecognizer) {
        
        if animals[currentAnimalIndex] == animals.last {
            currentAnimalIndex = 0;
        }
        else {
            currentAnimalIndex += 1
        }
        
        animal.image = UIImage(named: animals[currentAnimalIndex])
    }

    @IBAction func panAnimal(sender: UIPanGestureRecognizer) {
        
        animal.removeConstraints(animal.constraints)
        animal.center = sender.locationInView(view)
    }
    
    @IBAction func pinchAnimal(sender: UIPinchGestureRecognizer) {
        
        animal.transform = CGAffineTransformScale(animal.transform, sender.scale, sender.scale)
        sender.scale = 1.0        
    }
    
    @IBAction func rotateAnimal(sender: UIRotationGestureRecognizer) {
        
        animal.transform = CGAffineTransformRotate(animal.transform, sender.rotation)
        sender.rotation = 0
    }
    
    @IBAction func swipeBackground(sender: UISwipeGestureRecognizer) {
        
        if backgrounds[currentBackgroundIndex] == backgrounds.last {
            currentBackgroundIndex = 0
        }
        else {
            currentBackgroundIndex += 1
        }
        
        background.image = UIImage(named: backgrounds[currentBackgroundIndex])
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
    
}

