//
//  WelcomeViewController.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 3/30/24.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    
    var id: String?
    
    // MARK: - UIComponents
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.setTitle("메인으로", for: .normal)
        button.backgroundColor = .daangunOrange
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .daangunGray
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let daangniImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        image.image = UIImage(resource: .daangni)
        return image
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        bindID()
    }    
    
    // MARK: - UI & Layout
    
    private func setUI() {
        self.view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        [daangniImageView, welcomeLabel, mainButton, backButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func bindID() {
        
        if let id = id, id.count > 0 {
            self.welcomeLabel.text = "\(id)님 \n반가워요"
        } else {
            self.welcomeLabel.text = "사용자 입력 부탁 !"
        }
    }
    
}
