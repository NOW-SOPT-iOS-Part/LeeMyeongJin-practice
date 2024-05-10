//
//  LoginRequestModel.swift
//  practiceAfter4weeks
//
//  Created by 이명진 on 4/27/24.
//

import Foundation

struct LoginRequestModel: Codable {
    let authenticationId: String
    let password: String
}
