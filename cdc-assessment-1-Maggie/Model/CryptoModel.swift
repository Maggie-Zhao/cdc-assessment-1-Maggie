//
//  CryptoModel.swift
//  cdc-assessment-1-Maggie
//
//  Created by 赵明慧 on 2024/11/16.
//

import Foundation

struct CryptoModel: Codable {
    var data: [CryptoDetail]?
}

struct CryptoDetail: Codable {
    var title: String
}
