//: Playground - noun: a place where people can play
// Author: Vui Nguyen
// What: Test code to prepare software program that will be submitted
//       as part of my Trello application for the iOS Developer Position
// Date: February 28, 2016

import UIKit

func hash (eightLetterString: String) ->Int64
{
    var h:Int64 = 7
    let letters:String = "acdegilmnoprstuw"
    
    for i in 0..<eightLetterString.characters.count {
        let eightLetterStringIndex = eightLetterString.startIndex.advancedBy(i);
        print(eightLetterStringIndex)
        
        let eightLetterStringChar = eightLetterString[eightLetterStringIndex]
        print(eightLetterStringChar)
        
        
        let lettersIndex = letters.characters.indexOf(eightLetterStringChar)
        let position = letters.startIndex.distanceTo(lettersIndex!)
        h = (h * 37 + position);
        print(h);
        print("\n")
    }
    return h
}

hash("leepadg")

func reverseHash(hashie:Int64, wordLength:Int) -> String
{
    let letters:String = "acdegilmnoprstuw"
    let thirtySeven:Int64 = 37
    
    var remainders = [Int64]()
    remainders.insert(hashie, atIndex: 0)
    print(remainders[0])
    var remainder = hashie
    for i in 1..<wordLength+1 {
        remainders.insert(remainder / thirtySeven, atIndex: i)
        remainder = remainders[i]
        print (remainder)
    }

    var reversedString:String = ""
    var resultString:String = ""
    var letterIndex = 0
    for i in 0..<wordLength {
    
    letterIndex = remainders[i] - (remainders[i+1] * 37)
    print("\n")
    print(letterIndex)
    
    let lettersStringIndex = letters.startIndex.advancedBy(letterIndex);
    print (letters[lettersStringIndex])
    resultString.append(letters[lettersStringIndex])
    }
    
    reversedString = String(resultString.characters.reverse())
    print(reversedString)
    return reversedString
}

reverseHash(680131659347, wordLength:7)

reverseHash(25377615533200, wordLength:8)
