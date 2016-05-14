//
//  ReverseHashViewModel.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 5/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation
import UIKit

public enum ReverseHashResult {
    case NoResult(String, UIColor)
    case Error(String, UIColor)
    case Success(String, UIColor)
}

public class ReverseHashViewModel {
    private var model: HashConfigurationModel
    private var hashReverser: ((Int64) -> String)!
    
    public var hashNumber: String {
        get { return "\(model.hashNumber)" }
    }
    public var wordLength: String {
        get { return "\(model.wordLength)" }
    }
    
    init() {
        model = HashConfigurationModel(hashNumber: Constants.DefaultHashNumber, wordLength: Constants.DefaultWordLength)
        updateHashFunction()
    }
    
    private func updateHashFunction() -> Void {
        hashReverser = HashUtils.reverseHashGen(model.wordLength, hashKey: model.hashKey)
    }
    
    // MARK: View Notifications
    
    public func hashNumberUpdated(hashNumber: Int64) -> Void {
        model = HashConfigurationModel(hashNumber: hashNumber, wordLength: model.wordLength)
        updateHashFunction()
    }
    
    public func wordLengthUpdated(wordLength: Int) -> Void {
        model = HashConfigurationModel(hashNumber: model.hashNumber, wordLength: wordLength)
        updateHashFunction()
    }
    
    public func reverseHashRequested() -> ReverseHashResult {
        let reversed = hashReverser(model.hashNumber)
        let result = ReverseHashResult.Success(reversed, UIColor.greenColor())
        return result
    }
    
    public func reset() -> ReverseHashResult {
        model = HashConfigurationModel(hashNumber: Constants.DefaultHashNumber, wordLength: Constants.DefaultWordLength)
        updateHashFunction()
        
        return ReverseHashResult.NoResult("<answer displayed here>", UIColor.clearColor())
    }
}
