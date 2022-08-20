//
//  String.swift
//  ExtensionSakti
//
//  Created by Ragil Bimantara on 13/08/22.
//

import Foundation
import UIKit

extension String {
    
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
