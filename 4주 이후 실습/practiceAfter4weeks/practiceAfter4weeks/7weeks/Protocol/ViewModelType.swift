//
//  ViewModelType.swift
//  practiceAfter4weeks
//
//  Created by 이명진 on 5/29/24.
//

import Foundation
import RxSwift

protocol ViewModelType {

    associatedtype Input
    associatedtype Output

    func transform(from input: Input, disposeBag: DisposeBag) -> Output
}

