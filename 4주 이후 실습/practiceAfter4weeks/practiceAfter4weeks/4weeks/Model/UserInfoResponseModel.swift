//
//  UserInfoResponseModel.swift
//  practiceAfter4weeks
//
//  Created by 이명진 on 4/27/24.
//

import Foundation

// MARK: - UserInfoResponseModel
struct UserInfoResponseModel: Codable {
    let code: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let authenticationId, nickname, phone: String
}
