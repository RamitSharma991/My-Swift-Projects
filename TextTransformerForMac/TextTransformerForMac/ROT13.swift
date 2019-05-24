//
//  ROT13.swift
//  TextTransformerForMac
//
//  Created by Ramit sharma on 15/04/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import Foundation

struct ROT13 {
    private static var key = [Character: Character]()
    
    private static let uppercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private static let lowerercase = Array("abcdefghijklmnopqrstuvwxyz")
    
    
    static func string(_ string: String) -> String {
        if ROT13.key.isEmpty {
            for i in 0 ..< 26 {
                ROT13.key[ROT13.uppercase[i]] = ROT13.uppercase[(i + 13) % 26]
                ROT13.key[ROT13.lowerercase[i]] = ROT13.lowerercase[(i + 13) % 26]
                
            }
        }
        let transformed = string.map { ROT13.key[$0, default: $0]}
        return String(transformed)
    }
}
