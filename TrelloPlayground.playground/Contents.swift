//: Playground - noun: a place where people can play
// Author: Vui Nguyen
// What: Test code to prepare software program that will be submitted
//       as part of my Trello application for the iOS Developer Position
// Date: February 28, 2016

import UIKit

//func hash (eightLetterString: String) ->Int64
//{
//    var h:Int64 = 7
//    let letters:String = "acdegilmnoprstuw"
//    
//    for i in 0..<eightLetterString.characters.count {
//        let eightLetterStringIndex = eightLetterString.startIndex.advancedBy(i);
//        print(eightLetterStringIndex)
//        
//        let eightLetterStringChar = eightLetterString[eightLetterStringIndex]
//        print(eightLetterStringChar)
//        
//        
//        let lettersIndex = letters.characters.indexOf(eightLetterStringChar)
//        let position = letters.startIndex.distanceTo(lettersIndex!)
//        h = (h * 37 + position);
//        print(h);
//        print("\n")
//    }
//    return h
//}
//
//hash("leepadg")

func reverseHashGen(wordLength: Int, hashKey: String) -> (Int64) -> String {
    return {(hashie: Int64) -> String in
        return reverseHash(hashie, wordLength: wordLength, hashKey: hashKey)
    }
}

func reverseHash(hashie:Int64, wordLength:Int, hashKey: String) -> String
{
    let remainders = computeRemainders(hashie, wordLength: wordLength)
    let resultString = decodeRemainders(remainders, wordLength: wordLength, hashKey: hashKey)
    return resultString
}

func computeRemainders(hashie: Int64, wordLength: Int) -> [Int64] {
    var remainders:[Int64] = [hashie]
    for i in 1...wordLength {
        remainders.append(remainders[i-1] / 37)
    }
    return remainders
}

func decodeRemainders(remainders:[Int64], wordLength: Int, hashKey: String) -> String {
    var resultString = ""
    
    for i in (0..<wordLength).reverse() {
        let letterIndex = remainders[i] - (remainders[i+1] * 37)
        let lettersStringIndex = hashKey.startIndex.advancedBy(Int(letterIndex));
        
        resultString.append(hashKey[lettersStringIndex])
    }
    
    return resultString;
}

var reversed = reverseHash(680131659347, wordLength:7, hashKey: "acdegilmnoprstuw")
assert(reversed == "leepadg")

let exampleReverser = reverseHashGen(7, hashKey: "acdegilmnoprstuw")
reversed = exampleReverser(680131659347)
assert(reversed == "leepadg")

let problemReverser = reverseHashGen(8, hashKey: "acdegilmnoprstuw")
reversed = problemReverser(25377615533200)
