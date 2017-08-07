//
//  HashUtils.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 5/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

struct SolutionHashGenerator: HashGenerator {
    
    // Given a String, find its hash. The original forward hash
    // implementaiton for demonstration purposes.
    static func hash (_ inputString: String) -> Int64
    {
        var h:Int64 = 7
        let letters:String = Constants.ProblemHashKey
        
        for i in 0..<inputString.characters.count {
            let inputStringIndex = inputString.characters.index(inputString.startIndex, offsetBy: i);
            
            let inputStringChar = inputString[inputStringIndex]
            let lettersIndex = letters.characters.index(of: inputStringChar)
            let position = letters.characters.distance(from: letters.startIndex, to: lettersIndex!)
            h = h * Int64(37) + Int64(position)
        }
        return h
    }
    
    // Generate a reverse hash function given a word length and the hash key
    func reverseHashGen(_ wordLength: Int, hashKey: String) -> (Int64) -> String {
        return { (hashie: Int64) -> String in
            return SolutionHashGenerator.reverseHash(hashie,
                                                     wordLength: wordLength,
                                                     hashKey: hashKey)
        }
    }
    
    private static func reverseHash(_ hashie:Int64, wordLength:Int, hashKey: String) -> String {
        let remainders = computeRemainders(hashie, wordLength: wordLength)
        let resultString = decodeRemainders(remainders, wordLength: wordLength, hashKey: hashKey)
        return resultString
    }
    
    private static func computeRemainders(_ hashie: Int64, wordLength: Int) -> [Int64] {
        var remainders:[Int64] = [hashie]
        for i in 1...wordLength {
            remainders.append(remainders[i-1] / 37)
        }
        return remainders
    }
    
    private static func decodeRemainders(_ remainders:[Int64], wordLength: Int, hashKey: String) -> String {
        var resultString = ""
        
        for i in (0..<wordLength).reversed() {
            let letterIndex = remainders[i] - (remainders[i+1] * 37)
            let lettersStringIndex = hashKey.characters.index(hashKey.startIndex, offsetBy: Int(letterIndex));
            
            resultString.append(hashKey[lettersStringIndex])
        }
        
        return resultString;
    }
}
