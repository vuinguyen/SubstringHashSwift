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
    
    let viewModel = ReverseHashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Actions
    @IBAction func hashNumberChanged(_ sender: AnyObject) {
        //TODO: push parsing out to view model
        let hashNumber: Int64 = Int64(hashNumberField.text!)!;
        viewModel.hashNumberUpdated(hashNumber)
    }
    
    @IBAction func stringLengthChanged(_ sender: AnyObject) {
        //TODO: push parsing out to view model
        let wordLength = Int(stringLengthField.text!) ?? Constants.DefaultWordLength
        viewModel.wordLengthUpdated(wordLength)
    }
    
    @IBAction func calculateStringFromHash(_ sender: UIButton) {
        let result = viewModel.reverseHashRequested()
        updateWithResult(result)
    }
    
    @IBAction func resetToDefaultValues(_ sender: UIButton) {
        reset()
    }
    
    // MARK: View Helpers
    func reset() -> Void {
        let result = viewModel.reset()
        updateWithResult(result)
    }
    
    func updateWithResult(_ result: ReverseHashResult) -> Void {
        //TODO: these cases dont do anything different, we likely dont need an enum
        switch result {
        case .error(let message, let color):
            answerLabel.text = message
            answerLabel.backgroundColor = color
        case .noResult(let message, let color):
            answerLabel.text = message
            answerLabel.backgroundColor = color
        case .success(let message, let color):
            answerLabel.text = message
            answerLabel.backgroundColor = color
        }
    }
}

