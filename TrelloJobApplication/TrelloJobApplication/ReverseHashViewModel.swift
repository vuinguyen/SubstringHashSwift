//
//  ReverseHashViewModel.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 5/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation
import UIKit

class ReverseHashViewModel: ReverseHashViewModelProtocol {
    private let hashGenerator: HashGenerator
    private var model: HashConfigurationModel {
        didSet {
            updateHashFunction()
        }
    }
    private var hashReverser: ((Int64) -> String)
    
    init(hashGenerator: HashGenerator = SolutionHashGenerator()) {
        self.hashGenerator = hashGenerator
        self.model = HashConfigurationModel(hashNumber: Constants.DefaultHashNumber, wordLength: Constants.DefaultWordLength)
        self.hashReverser = self.hashGenerator.reverseHashGen(model.wordLength, hashKey: model.hashKey)
    }
    
    private func updateHashFunction() -> Void {
        hashReverser = hashGenerator.reverseHashGen(model.wordLength, hashKey: model.hashKey)
    }
    
    // MARK: View Notifications
    
    func hashNumberUpdated(_ hashNumber: String?) -> Void {
        var number = Int64(0)
        if let hashNumber = hashNumber, let parsedNumber = Int64(hashNumber) {
            number = parsedNumber
        }
        model = HashConfigurationModel(hashNumber: number, wordLength: model.wordLength)
    }
    
    func wordLengthUpdated(_ wordLength: String?) -> Void {
        var length = Constants.DefaultWordLength
        if let wordLength = wordLength, let parsedLength = Int(wordLength) {
           length = parsedLength
        }
        model = HashConfigurationModel(hashNumber: model.hashNumber, wordLength: length)
    }
    
    func reverseHashRequested() -> ReverseHashResult {
        let reversed = hashReverser(model.hashNumber)
        return .success(reversed)
    }
    
    func reset() -> ReverseHashResult {
        model = HashConfigurationModel(hashNumber: Constants.DefaultHashNumber, wordLength: Constants.DefaultWordLength)
        return .noResult("<answer displayed here>")
    }
}
