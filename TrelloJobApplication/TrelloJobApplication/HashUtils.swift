//
//  HashUtils.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 5/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

struct HashUtils {
    
    // Given a String, find its hash. The original forward hash
    // implementaiton for demonstration purposes.
    static func hash (inputString: String) -> Int64
    {
        var h:Int64 = 7
        let letters:String = Constants.ProblemHashKey
        
        for i in 0..<inputString.characters.count {
            let inputStringIndex = inputString.startIndex.advancedBy(i);
            
            let inputStringChar = inputString[inputStringIndex]
            let lettersIndex = letters.characters.indexOf(inputStringChar)
            let position = letters.startIndex.distanceTo(lettersIndex!)
            h = (h * 37 + position);
        }
        return h
    }
    
    // Generate a reverse hash function given a word length and the hash key
    static func reverseHashGen(wordLength: Int, hashKey: String) -> (Int64) -> String {
        return {(hashie: Int64) -> String in
            return reverseHash(hashie, wordLength: wordLength, hashKey: hashKey)
        }
    }
    
    static func reverseHash(hashie:Int64, wordLength:Int, hashKey: String) -> String
    {
        let remainders = computeRemainders(hashie, wordLength: wordLength)
        let resultString = decodeRemainders(remainders, wordLength: wordLength, hashKey: hashKey)
        return resultString
    }
    
    static func computeRemainders(hashie: Int64, wordLength: Int) -> [Int64] {
        var remainders:[Int64] = [hashie]
        for i in 1...wordLength {
            remainders.append(remainders[i-1] / 37)
        }
        return remainders
    }
    
    static func decodeRemainders(remainders:[Int64], wordLength: Int, hashKey: String) -> String {
        var resultString = ""
        
        for i in (0..<wordLength).reverse() {
            let letterIndex = remainders[i] - (remainders[i+1] * 37)
            let lettersStringIndex = hashKey.startIndex.advancedBy(Int(letterIndex));
            
            resultString.append(hashKey[lettersStringIndex])
        }
        
        return resultString;
    }
}
