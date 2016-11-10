//
//  File.swift
//  TrelloJobApplication
//
//  Created by Benjamin Snider on 10/22/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation
import UIKit

public enum ReverseHashResult {
    case noResult(String)
    case error(String)
    case success(String)
    
    var color: UIColor {
        get {
            switch self {
            case .noResult:
                return UIColor.clear
            case .error:
                return UIColor.red
            case .success:
                return UIColor.green
            }
        }
    }
}
