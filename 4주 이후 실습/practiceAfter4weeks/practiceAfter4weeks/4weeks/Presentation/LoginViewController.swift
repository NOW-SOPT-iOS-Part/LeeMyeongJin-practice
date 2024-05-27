//
//  LoginViewController.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 3/30/24.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa


/// LoginViewController
/// 이 파일에서는 ViewController가 많은 역할을 합니다.
/// ViewController에서 뷰이동 로직을 담당하고, 뷰를 그리는 로직도 있습니다.
/// 단일 책임원칙을 위배 하였습니다.
/// 글씨와 같은 상수는 따로 빼줘야 OCP 원칙을 지킨다고도 생각했습니다.
/// DIP를 적용하지 못했기 때문에 

final class LoginViewController: UIViewController {
    
    // MARK: - UIComponents
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.font = .subhead01
        label.numberOfLines = 2
        return label
    }()
    
    private let titlesLabel = UILabel().then {
        $0.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .subhead01
        $0.numberOfLines = 2
    }
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = " 아이디"
        textField.layer.cornerRadius = 3
        textField.font = .subhead04
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = " 비밀번호"
        textField.layer.cornerRadius = 3
        textField.font = .subhead04
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 58))
        button.backgroundColor = .daangunOrange
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .subhead01
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 3
        return button
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        
        [titleLabel, idTextField, passwordTextField, loginButton].forEach { [weak self] view in
            guard let self else { return }
//            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
    }
    
//    private func setLayout() {
//        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 161),
//                                     titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 69),
//                                     titleLabel.widthAnchor.constraint(equalToConstant: 236),
//                                     titleLabel.heightAnchor.constraint(equalToConstant: 44)])
//
//        NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 276),
//                                     idTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//                                     idTextField.widthAnchor.constraint(equalToConstant: 335),
//                                     idTextField.heightAnchor.constraint(equalToConstant: 52)])
//
//        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
//                                     passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//                                     passwordTextField.widthAnchor.constraint(equalToConstant: 335),
//                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
//
//        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
//                                     loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//                                     loginButton.widthAnchor.constraint(equalToConstant: 335),
//                                     loginButton.heightAnchor.constraint(equalToConstant: 52)])
//    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(161)
            $0.leading.trailing.equalToSuperview().inset(69)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(276)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
    }
    
    private func bind() {
        loginButton.rx.tap
            .subscribe { <#Void#> in
                <#code#>
            } onError: { <#Error#> in
                <#code#>
            } onCompleted: {
                <#code#>
            } onDisposed: {
                <#code#>
            }

    }
    
    // MARK: - Methods
    
    @objc
    private func loginButtonDidTap() {
        presentToWelcomeVC()
        //        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        welcomeViewController.modalPresentationStyle = .overFullScreen
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
