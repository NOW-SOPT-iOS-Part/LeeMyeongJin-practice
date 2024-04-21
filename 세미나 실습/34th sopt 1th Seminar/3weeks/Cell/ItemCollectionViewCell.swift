//
//  ItemCollectionViewCell.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/20/24.
//

import UIKit

import SnapKit
import Then

class ItemCollectionViewCell: UICollectionViewCell {
    
    private let productImage = UIImageView().then {
        $0.image = UIImage(resource: .product7)
    }
    
    private let productTitle = UILabel().then {
        $0.text = "아이폰 13 맥스"
        $0.textColor = .black
        $0.font = .subhead02
    }
    
    private let productPrice = UILabel().then {
        $0.text = "1,000,000 원"
        $0.textColor = .daangunOrange
        $0.font = .subhead02
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        addSubviews(
            productImage,
            productTitle,
            productPrice
        )
        
        productImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(139)
            $0.width.equalTo(98)
        }
        
        productTitle.snp.makeConstraints {
            $0.top.equalTo(productImage.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(8)
        }
        
        productPrice.snp.makeConstraints {
            $0.top.equalTo(productTitle.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(8)
        }
    }
}

extension ItemCollectionViewCell {
    func dataBind(data: ItemModel) {
        self.productImage.image = data.productImage
        self.productPrice.text = data.price
        self.productTitle.text = data.name
    }
}
