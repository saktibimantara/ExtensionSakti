//
//  Array.swift
//  ExtensionSakti
//
//  Created by Ragil Bimantara on 13/08/22.
//

import Foundation

public extension Array {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
