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
    case noResult(String, UIColor)
    case error(String, UIColor)
    case success(String, UIColor)
}

open class ReverseHashViewModel {
    fileprivate var model: HashConfigurationModel
    fileprivate var hashReverser: ((Int64) -> String)!
    
    open var hashNumber: String {
        get { return "\(model.hashNumber)" }
    }
    open var wordLength: String {
        get { return "\(model.wordLength)" }
    }
    
    init() {
        model = HashConfigurationModel(hashNumber: Constants.DefaultHashNumber, wordLength: Constants.DefaultWordLength)
        updateHashFunction()
    }
    
    fileprivate func updateHashFunction() -> Void {
        hashReverser = HashUtils.reverseHashGen(model.wordLength, hashKey: model.hashKey)
    }
    
    // MARK: View Notifications
    
    open func hashNumberUpdated(_ hashNumber: Int64) -> Void {
        model = HashConfigurationModel(hashNumber: hashNumber, wordLength: model.wordLength)
        updateHashFunction()
    }
    
    open func wordLengthUpdated(_ wordLength: Int) -> Void {
        model = HashConfigurationModel(hashNumber: model.hashNumber, wordLength: wordLength)
        updateHashFunction()
    }
    
    open func reverseHashRequested() -> ReverseHashResult {
        let reversed = hashReverser(model.hashNumber)
        let result = ReverseHashResult.success(reversed, UIColor.green)
        return result
    }
    
    open func reset() -> ReverseHashResult {
        model = HashConfigurationModel(hashNumber: Constants.DefaultHashNumber, wordLength: Constants.DefaultWordLength)
        updateHashFunction()
        
        return ReverseHashResult.noResult("<answer displayed here>", UIColor.clear)
    }
}
