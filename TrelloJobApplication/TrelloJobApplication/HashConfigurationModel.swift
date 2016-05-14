//
//  HashConfigurationModel.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 5/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

struct HashConfigurationModel {
    let hashNumber: Int64
    let wordLength: Int
    let hashKey: String
    
    init(hashNumber: Int64, wordLength: Int, hashKey: String? = nil) {
        self.hashNumber = hashNumber
        self.wordLength = wordLength
        self.hashKey = hashKey ?? Constants.ProblemHashKey
    }
}

// MARK: Equatable Implementation
extension HashConfigurationModel: Equatable {}
func ==(lhs: HashConfigurationModel, rhs: HashConfigurationModel) -> Bool {
    return lhs.hashNumber == rhs.hashNumber &&
        lhs.wordLength == rhs.wordLength &&
        lhs.hashKey == rhs.hashKey
}
