//
//  LoginViewModel.swift
//  practiceAfter4weeks
//
//  Created by 이명진 on 5/29/24.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: ViewModelType {
    
    struct Input {
        let idTextInput: Observable<String>
        let passwordTextInput: Observable<String>
    }
    
    struct Output {
        let isValid: Observable<Bool>
    }
}

extension LoginViewModel {
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let isValid = Observable.combineLatest(input.idTextInput, input.passwordTextInput)
            .map { id, password in
                return !id.isEmpty && !password.isEmpty
            }
            .share(replay: 1)
        
        return Output(isValid: isValid)
    }
}
