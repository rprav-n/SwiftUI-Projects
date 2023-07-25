//
//  Constants.swift
//  BB Quotes
//
//  Created by Praveen R on 25/07/23.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
