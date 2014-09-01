//
//  ViewController.swift
//  Tipster
//
//  Created by Alli Dryer on 8/25/14.
//  Copyright (c) 2014 Alli Dryer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
                            
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var unhappy: UIImageView!
    
    @IBOutlet weak var happy: UIImageView!
    
    @IBOutlet weak var love: UIImageView!
    
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let duration = 0.13
        let delay = 0.2
        let options = UIViewAnimationOptions.CurveEaseInOut
        let damping = 0.5
        let velocity = 1.0
        
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            self.logo.transform = CGAffineTransformMakeRotation(0.5)
        
            }, completion: { finished in
                UIView.animateWithDuration(duration, delay: 0.0, options: options, animations: {
                    self.logo.transform = CGAffineTransformMakeRotation(0)
                    }, completion: { finished in })
        })
        
        self.unhappy.alpha = 0
        self.happy.alpha = 0
        self.love.alpha = 0
        
        UISegmentedControl.appearance().setTitleTextAttributes(NSDictionary(objects: [UIFont(name: "Gotham Rounded", size: 18.0)], forKeys: [NSFontAttributeName]), forState: UIControlState.Normal)
        
        if tipControl.selectedSegmentIndex == 0 {
            self.unhappy.alpha = 1
        }
        else {
            self.unhappy.alpha = 0
        }
        
        if tipControl.selectedSegmentIndex == 1 {
            self.happy.alpha = 1
        }
        else {
            self.happy.alpha = 0
        }
        
        if tipControl.selectedSegmentIndex == 2 {
            self.love.alpha = 1
        }
        else {
            self.love.alpha = 0
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let duration = 0.13
        let delay = 0.0
        let options = UIViewAnimationOptions.CurveEaseInOut
        let damping = 0.5
        let velocity = 1.0
        
        if tipControl.selectedSegmentIndex == 0 {
            
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.unhappy.alpha = 1
                self.unhappy.frame = CGRect(x: self.unhappy.frame.origin.x, y: self.unhappy.frame.origin.y-8, width: self.unhappy.frame.width, height: self.unhappy.frame.height)
                
                }, completion: { finished in
                    UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                        self.unhappy.frame = CGRect(x: self.unhappy.frame.origin.x, y: self.unhappy.frame.origin.y+8, width: self.unhappy.frame.width, height: self.unhappy.frame.height)
                    }, completion: { finished in })
            })
            
        }
        else {
            self.unhappy.alpha = 0
        }
        
        if tipControl.selectedSegmentIndex == 1 {
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.happy.alpha = 1
                self.happy.frame = CGRect(x: self.happy.frame.origin.x, y: self.unhappy.frame.origin.y-8, width: self.happy.frame.width, height: self.happy.frame.height)
                
                }, completion: { finished in
                    UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                        self.happy.frame = CGRect(x: self.happy.frame.origin.x, y: self.happy.frame.origin.y+8, width: self.happy.frame.width, height: self.happy.frame.height)
                        }, completion: { finished in })
            })
            
        }
        else {
            self.happy.alpha = 0
        }
        
        if tipControl.selectedSegmentIndex == 2 {
            UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                self.love.alpha = 1
                self.love.frame = CGRect(x: self.love.frame.origin.x, y: self.love.frame.origin.y-8, width: self.love.frame.width, height: self.love.frame.height)
                
                }, completion: { finished in
                    UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
                        self.love.frame = CGRect(x: self.love.frame.origin.x, y: self.love.frame.origin.y+8, width: self.love.frame.width, height: self.love.frame.height)
                        }, completion: { finished in })
            })
            
        }
        else {
            self.love.alpha = 0
        }
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing (true)
        
    }

}

