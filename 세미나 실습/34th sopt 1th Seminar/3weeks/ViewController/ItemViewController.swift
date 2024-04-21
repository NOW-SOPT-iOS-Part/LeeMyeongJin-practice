//
//  ItemViewController.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/20/24.
//

import Foundation

import UIKit

final class ItemViewController: UIViewController {
    
    private var itemData = ItemModel.dummy()
    
    // MARK: - UIComponents
    
    private let itemView = ItemView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = itemView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
    }
    
    
    // MARK: - UI & Layout
    
    private func setDelegate() {
        itemView.itemCollectionView.delegate = self
        itemView.itemCollectionView.dataSource = self
    }
    
    private func setRegister() {
        itemView.itemCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.className)
    }
    
}

extension ItemViewController: UICollectionViewDelegate {
    
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = itemView.itemCollectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.className, for: indexPath)  as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dataBind(data: itemData[indexPath.row])
        return cell
    }
    
    
}
