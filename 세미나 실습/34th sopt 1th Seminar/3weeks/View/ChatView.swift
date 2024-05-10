//
//  ChatView.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/20/24.
//

import UIKit

import SnapKit
import Then

import UIKit

final class ChatView: UIView {
    
    // MARK: - UIComponents
    
    private let navigationView = UIView()
    
    private let titleLabel = UILabel().then {
        $0.text = "채팅"
        $0.font = .subhead01
    }
    
    private lazy var QRCodeCodeButton = UIButton().then {
        $0.setImage(UIImage(resource: .icQRCode), for: .normal)
    }
    
    private lazy var alertButton = UIButton().then {
        $0.setImage(UIImage(resource: .icAlert), for: .normal)
    }
    
    private lazy var HStackView = UIStackView(
        arrangedSubviews: [
            titleLabel,
            QRCodeCodeButton,
            alertButton
        ]
    ).then {
        $0.axis = .horizontal
        $0.spacing = 16
        $0.alignment = .leading
    }
    
    let chatTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        addSubviews(
            HStackView,
            chatTableView
        )
    }
    
    private func setLayout() {
        HStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(48)
        }
        
        chatTableView.snp.makeConstraints {
            $0.top.equalTo(HStackView.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}

