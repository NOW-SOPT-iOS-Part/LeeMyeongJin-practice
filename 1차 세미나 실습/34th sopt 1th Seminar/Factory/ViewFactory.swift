//
//  ViewFactory.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/6/24.
//

import UIKit

import Then
func viewFactory(background: UIColor) -> UIView {
    
    return UIView().then {
        $0.backgroundColor = background
    }
}
