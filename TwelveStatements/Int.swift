//
//  Int.swift
//  TwelveStatements
//
//  Created by Тимур on 07.03.15.
//  Copyright (c) 2015 SPbAU RAS. All rights reserved.
//

import Foundation

extension Int {
    func binaryRepresentationOfLenght(length: Int) -> [Int] {
        var binaryRepresentation:[Int] = []
        var value = self
        while (value != 0) {
            binaryRepresentation.append(value & 1)
            value /= 2
        }
        return binaryRepresentation.pad(0, times: length-binaryRepresentation.count, toThe: .Right).reverse()
    }
}