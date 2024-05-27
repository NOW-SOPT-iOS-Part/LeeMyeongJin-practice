//
//  ViewModelType.swift
//  practiceAfter4weeks
//
//  Created by 이명진 on 5/25/24.
//

import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}
