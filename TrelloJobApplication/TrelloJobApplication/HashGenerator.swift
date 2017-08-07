//
//  HashGenerator.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 10/22/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

protocol HashGenerator {
    /** Get a hash generator given the word length and a hash key. */
    func reverseHashGen(_ wordLength: Int, hashKey: String) -> (Int64) -> String
}
