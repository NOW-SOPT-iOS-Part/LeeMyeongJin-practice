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
        $0.textColor = .gray
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Bold", size: 12)
    }
    
    private let chatLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    private let itemImageView = UIImageView()
    
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
            chatLabel,
            itemImageView
        )
        
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
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
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
        }
        
    }
}


extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = chatData.itemImg
    }
}
