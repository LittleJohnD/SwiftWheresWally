//
//  ViewController.swift
//  SwiftWheresWally
//
//  Created by John Dyer on 20/01/2015.
//  Copyright (c) 2015 John Dyer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameEntry: UITextField!
    @IBOutlet weak var shownName: UILabel!
    @IBOutlet weak var lastButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showNext(sender: UIButton) {
    }
    
    @IBAction func showLast(sender: UIButton) {
    }
    @IBAction func addName(sender: UIButton) {
        
    }


}

