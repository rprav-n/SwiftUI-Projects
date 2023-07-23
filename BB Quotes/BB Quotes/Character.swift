//
//  Character.swift
//  BB Quotes
//
//  Created by Praveen R on 23/07/23.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images : [URL]
    let aliaes: [String]
    let portrayedBy: String
}
