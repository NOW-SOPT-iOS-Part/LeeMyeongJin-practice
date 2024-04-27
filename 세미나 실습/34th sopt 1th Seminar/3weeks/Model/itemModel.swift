//
//  itemModel.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/20/24.
//

import UIKit

struct ItemModel {
    let productImage: UIImage
    let name: String
    let price: String
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(productImage: .product1 ,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .product2,name: "커피 머신", price: "25,000 원"),
            ItemModel(productImage: .product3,name: "에소프레소 더블샷", price: "1,000,000 원"),
            ItemModel(productImage: .product4,name: "명진이의 사랑", price: "1,000,000 원"),
            ItemModel(productImage: .product5,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .product6,name: "커피 머신", price: "1,000,000 원"),
            ItemModel(productImage: .product7,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .product9,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .product8,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .product1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .product2,name: "아이폰 13 프로맥스", price: "1,000,000 원")
        ]
    }
}
