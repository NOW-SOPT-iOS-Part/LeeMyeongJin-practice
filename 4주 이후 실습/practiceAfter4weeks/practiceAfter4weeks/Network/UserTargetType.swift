//
//  UserTargetType.swift
//  practiceAfter4weeks
//
//  Created by 이명진 on 4/27/24.
//

import Foundation

import Moya


enum UserTargetType {
    case getUserInfo(memberId: String)
    case signUp(request: SignUpRequestModel)
    case signIn(data: LoginRequestModel)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        return URL(string: "http://34.64.233.12:8080")!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/member/join"
        case .getUserInfo(memberId: _):
            return "/member/info"
        case .signIn(data: _):
            return "/member/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp, .signIn:
            return .post
        case .getUserInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let request):
            return .requestJSONEncodable(request)
        case .getUserInfo:
            return .requestPlain
        case .signIn(let data):
            return .requestJSONEncodable(data)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case.signUp, .signIn:
            return ["Content-Type": "application/json"]
        case .getUserInfo(let memberId):
            return ["Content-Type": "application/json",
                    "memberId" : memberId]
        }
        
    }
}


