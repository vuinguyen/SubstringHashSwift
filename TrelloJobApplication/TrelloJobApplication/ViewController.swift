//
//  ViewController.swift
//  TrelloJobApplication
//
//  Created by Vui Nguyen on 2/28/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var hashNumberField: UITextField!
    @IBOutlet weak var stringLengthField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field's user input through delegate callbacks
        hashNumberField.delegate   = self
        stringLengthField.delegate = self
    }
    
    // Given a String, find its hash
    // I wrote this function first, in order to create the reverseHash function
    func hash (inputString: String) ->Int64
    {
        var h:Int64 = 7
        let letters:String = "acdegilmnoprstuw"
        
        for i in 0..<inputString.characters.count {
            let inputStringIndex = inputString.startIndex.advancedBy(i);
            print(inputStringIndex)
            
            let inputStringChar = inputString[inputStringIndex]
            print(inputStringChar)
            
            
            let lettersIndex = letters.characters.indexOf(inputStringChar)
            let position = letters.startIndex.distanceTo(lettersIndex!)
            h = (h * 37 + position);
            print(h);
            print("\n")
        }
        return h
    }
    
    // Given a hash, find its String
    func reverseHash(hashie:Int64, wordLength:Int) -> (calculatedString: String, background: UIColor)
    {
        let letters:String = "acdegilmnoprstuw"
        let thirtySeven:Int64 = 37
        
        var remainders = [Int64]()
        remainders.insert(hashie, atIndex: 0)
        print(remainders[0])
        var remainder = hashie
        for i in 1..<wordLength+1 {
            remainders.insert(remainder / thirtySeven, atIndex: i)
            remainder = remainders[i]
            
            print (remainder)
            if (remainder <= 0)
            {
                return ("Error:Hash is too short for string length", UIColor.redColor())
            }
        }
        
        var reversedString:String = ""
        var resultString:String = ""
        var letterIndex = 0
        for i in 0..<wordLength {
            
            letterIndex = remainders[i] - (remainders[i+1] * 37)
            print("\n")
            print(letterIndex)
            
            if (letterIndex >= letters.characters.count)
            {
                return ("Error: Hash is too long for string length", UIColor.redColor())
            }
            let lettersStringIndex = letters.startIndex.advancedBy(letterIndex);
            print (letters[lettersStringIndex])
            resultString.append(letters[lettersStringIndex])
        }
        
        reversedString = String(resultString.characters.reverse())
        print(reversedString)
        return (reversedString, UIColor.greenColor())
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions
    @IBAction func calculateStringFromHash(sender: UIButton) {
        let hashie:Int64?           = Int64(hashNumberField.text!);
        let wordLength              = Int(stringLengthField.text!);
        let reverseHashValues       = reverseHash(hashie!, wordLength:wordLength!)
        answerLabel.text            = reverseHashValues.calculatedString
        answerLabel.backgroundColor = reverseHashValues.background
    }
    
    @IBAction func resetToDefaultValues(sender: UIButton) {
        hashNumberField.text   = "25377615533200"
        stringLengthField.text = "8"
        answerLabel.text       = "<answer displayed here>"
        answerLabel.backgroundColor = UIColor.clearColor()
    }
}

