//
//  UIView+.swift
//  practiceAfter4weeks
//
//  Created by 이명진 on 4/27/24.
//

import UIKit

extension UIView {
    /// 여러 뷰를 한번에 서브뷰에 담는 코드 입니다.
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
