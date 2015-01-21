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
    var nameIndex: Int = 0
    var listOfNames: [String] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Allocate and initialise listofNames as an empty list
        listOfNames = [String]()
        
        //Make nameIndex to be zero
        nameIndex = 0
        
        //Hide both of the showNext/showLast buttons
        self.lastButton.hidden=true
        self.nextButton.hidden=true
        
        //Make nameEntry.delegate = self;
        //self.nameEntry.delegate = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(nameEntry: UITextField!) -> Bool
    {
        nameEntry.resignFirstResponder()
        addName(nameEntry)
        return true
    }
    
    @IBAction func showNext(sender: UIButton)
    {
        if nameIndex<listOfNames.count
        {
            if nameIndex < listOfNames.count
            {
                //increment nameIndex
                nameIndex++
            }
            //if it is the last name, hide the next button
            if nameIndex == listOfNames.count
            {
                self.nextButton.hidden=true
            }
            //if it is not the first one, show the previous button show the name at nameIndex-1 on the label
            if nameIndex>0
            {
                self.lastButton.hidden=false
                self.shownName.text = listOfNames[(nameIndex-1)]
            }
        }
    }
    
    @IBAction func showLast(sender: UIButton)
    {
        //Do showLast similarly to show/ hide buttons appropriately
        if nameIndex>0
        {
            //decrement nameIndex
            nameIndex--
        }
        //Ensure next button is showing when moving away from the maxium count
        if nameIndex < listOfNames.count
        {
            self.nextButton.hidden=false
        }
        //when at the first hide button
        if nameIndex == 1
        {
            self.lastButton.hidden=true
        }
        //show the the name in the label
        self.shownName.text = listOfNames[(nameIndex-1)]
    }
        
    @IBAction func addName(sender: AnyObject)
    {
        //if the textField is not empty, add the name to the list of names
        if countElements(self.nameEntry.text) != 0
        {
            listOfNames.append(self.nameEntry.text.capitalizedString)
        }
        //if the list of names is now 1 name long, then put the name in the label and make nameIndex = 1
        if listOfNames.count > 0
        {
            self.shownName.text = listOfNames[0]
            nameIndex = 1
            //self.lastButton.hidden=true
        }
        //else if there are now more names in the list than nameIndex, then show the "Next" button.
        if listOfNames.count > 1
        {
            self.nextButton.hidden=false;
        }
        //if the new name is "Wally" then run the following alert code:
        if self.nameEntry.text.capitalizedString=="Wally"
        {
            var alert = UIAlertController(title: "Found Wally", message: "There he is!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        //Clear the name from the text field.
        self.nameEntry.text = ""
    }
}