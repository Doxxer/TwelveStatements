//
//  Array.swift
//  TwelveStatements
//
//  Created by Тимур on 07.03.15.
//  Copyright (c) 2015 SPbAU RAS. All rights reserved.
//

import Foundation

internal enum PaddingOption {
    case Left
    case Right
}

extension Array {
    func pad(element: Element, times: Int, toThe: PaddingOption) -> Array<Element> {
        let padded = [Element](count: times, repeatedValue: element)
        switch(toThe) {
        case .Left:
            return padded + self
        case .Right:
            return self + padded
        }
    }
    
    func take(n: Int) -> Array<Element> {
        if n <= 0 {
            return []
        }
        return Array(self[0..<Swift.min(n, self.count)])
    }
    
    func drop(n: Int) -> Array<Element> {
        if n <= 0 {
            return self
        } else if n >= self.count {
            return []
        }
        return Array(self[n..<self.count])
    }
    
    func stride(n: Int) -> Array<Element> {
        var result:[Element] = []
        for i in Swift.stride(from: 0, to: self.count, by: n) {
            result.append(self[i])
        }
        return result
    }
    
    func zipWithIndex() -> Array<(Element, Int)> {
        return [(Element, Int)](zip(self, indices(self)))
    }
}