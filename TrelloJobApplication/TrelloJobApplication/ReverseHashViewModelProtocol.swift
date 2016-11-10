//
//  ReverseHashViewModelProtocol.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 10/22/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

protocol ReverseHashViewModelProtocol {
    /** Called to notify the view model that the hash number updated. */
    func hashNumberUpdated(_ hashNumber: String?)
    
    /** Called to notify the view model that the word length updated. */
    func wordLengthUpdated(_ wordLength: String?) -> Void
    
    /** Called to notify the view model that the reverse hash was requested. */
    func reverseHashRequested() -> ReverseHashResult
    
    /** Called to reset the view model's state. */
    func reset() -> ReverseHashResult
}
