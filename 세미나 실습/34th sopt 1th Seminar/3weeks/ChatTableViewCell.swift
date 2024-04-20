//
//  ChatTableViewCell.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/20/24.
//

import UIKit

import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {
    
    // MARK: - UIComponets
    
    private let profileImageView = UIImageView()
    
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
    }
    
    private let placeLabel = UILabel().then {
        $0.textColor = UIColor(red: 156, green: 156, blue: 156, alpha: 1)
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Bold", size: 12)
    }
    
    private let chatLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    private let productImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        addSubviews(
            profileImageView,
            nameLabel,
            placeLabel,
            chatLabel
        )
        
        profileImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        placeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(16)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
        }
    }
}
