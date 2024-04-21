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
            ItemModel(productImage: .profile1 ,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "커피 머신", price: "25,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "커피 머신", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원"),
            ItemModel(productImage: .profile1,name: "아이폰 13 프로맥스", price: "1,000,000 원")
        ]
    }
}
