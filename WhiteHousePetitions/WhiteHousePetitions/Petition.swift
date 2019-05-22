//
//  Petition.swift
//  WhiteHousePetitions
//
//  Created by Ramit sharma on 09/04/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
