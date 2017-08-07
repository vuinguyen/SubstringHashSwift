//
//  ViewController.swift
//  TrelloJobApplication
//
//  Created by Vui Nguyen on 2/28/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

class ReverseHashViewController: UIViewController, UITextFieldDelegate {
    static let StoryboardIdentifier = "ReverseHashViewController"
    
    // MARK: Properties
    @IBOutlet weak var hashNumberField: UITextField!
    @IBOutlet weak var stringLengthField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    var viewModel: ReverseHashViewModelProtocol!
    
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
        viewModel.hashNumberUpdated(hashNumberField.text)
    }
    
    @IBAction func stringLengthChanged(_ sender: AnyObject) {
        viewModel.wordLengthUpdated(stringLengthField.text)
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
        switch result {
        case .error(let message):
            answerLabel.text = message
            answerLabel.backgroundColor = result.color
        case .noResult(let message):
            answerLabel.text = message
            answerLabel.backgroundColor = result.color
        case .success(let message):
            answerLabel.text = message
            answerLabel.backgroundColor = result.color
        }
    }
}

