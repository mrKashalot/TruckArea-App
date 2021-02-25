//
//  MenuViewController.swift
//  DRAWTEST
//
//  Created by Владислав on 25.01.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var truckMenuView: CustomView!
    @IBOutlet weak var greyBlockView: CustomView!
    @IBOutlet weak var orangeBlockView: CustomView!
    @IBOutlet weak var blueBlockView: CustomView!
    @IBOutlet weak var menuButton: ButtonStyle!
    @IBOutlet weak var greyMenuView: UIView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var yellowBlockView: CustomView!
    @IBOutlet weak var grennBlockView: CustomView!
    
    @IBOutlet weak var manualButton: ButtonStyle!
    @IBOutlet weak var greyAnimBlockLogo: UIView!
    @IBOutlet weak var bluAnimBlockLogo: UIView!
    
    let sounfButtonCreate = SimpleSound(named: "chik")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shakeViewAnimation1()
        shakeViewAnimation2()
        shakeViewAnimation3()
        shakeViewAnimation4()
        shakeViewAnimation5()
        shakeViewAnimation6()
        shakeViewAnimation7()
        shakeViewAnimation8()
    }
    
    func shakeViewAnimation1(){
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 4.9
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: greyBlockView.center.x, y: greyBlockView.center.y - 20)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: greyBlockView.center.x, y: greyBlockView.center.y + 500)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        greyBlockView.layer.add(shake, forKey: "position")
    }
    
    func shakeViewAnimation2(){
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 4.6
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: orangeBlockView.center.x, y: orangeBlockView.center.y - 20)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: orangeBlockView.center.x, y: orangeBlockView.center.y + 500)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        orangeBlockView.layer.add(shake, forKey: "position")
    }
    
    func shakeViewAnimation3(){
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 3.5
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: blueBlockView.center.x, y: blueBlockView.center.y - 20)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: blueBlockView.center.x, y: blueBlockView.center.y + 500)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        blueBlockView.layer.add(shake, forKey: "position")
    }
    
    func shakeViewAnimation4(){
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 3.9
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: yellowBlockView.center.x, y: yellowBlockView.center.y - 20)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: yellowBlockView.center.x, y: yellowBlockView.center.y + 500)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        yellowBlockView.layer.add(shake, forKey: "position")
    }
    
    func shakeViewAnimation5(){
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 5
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: grennBlockView.center.x, y: grennBlockView.center.y - 20)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: grennBlockView.center.x, y: grennBlockView.center.y + 500)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        grennBlockView.layer.add(shake, forKey: "position")
    }
    
    func shakeViewAnimation6(){
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 5
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: greyMenuView.center.x - 20, y: greyMenuView.center.y)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: greyMenuView.center.x + 20, y: greyMenuView.center.y)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        greyMenuView.layer.add(shake, forKey: "position")
    }
    
    func shakeViewAnimation7() {
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 3
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: bluAnimBlockLogo.center.x - 20, y: bluAnimBlockLogo.center.y)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: bluAnimBlockLogo.center.x + 20, y: bluAnimBlockLogo.center.y)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        bluAnimBlockLogo.layer.add(shake, forKey: "position")
    }
    
    func shakeViewAnimation8() {
        let shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 2
        shake.repeatCount = 500
        shake.autoreverses = true
        
        let from_point:CGPoint = CGPoint(x: greyAnimBlockLogo.center.x - 25, y: greyAnimBlockLogo.center.y)
        let from_value:NSValue = NSValue(cgPoint: from_point)
        
        let to_point:CGPoint = CGPoint(x: greyAnimBlockLogo.center.x + 25, y: greyAnimBlockLogo.center.y)
        let to_value:NSValue = NSValue(cgPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        greyAnimBlockLogo.layer.add(shake, forKey: "position")
    }
    @IBAction func createButtonPress(_ sender: Any) {
        sounfButtonCreate.play()
    }
    
    
    @IBAction func manualButtonPress(_ sender: Any) {
        sounfButtonCreate.play()
    }
}


