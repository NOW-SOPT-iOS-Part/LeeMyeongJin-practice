//
//  ItemView.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/20/24.
//

import UIKit

final class ItemView: UIView {
    
    // MARK: - UIComponets
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterLineSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    lazy var itemCollectionView = UICollectionView(frame: .zero,
                                                   collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width
        
        layout.sectionInset = carrotInset
        layout.minimumInteritemSpacing = carrotInterLineSpacing
        layout.minimumLineSpacing = carrotLineSpacing
        
        let totalSpacing = layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing
        let cellWidth = (screenWidth - totalSpacing) / 2
        let cellHeight = cellWidth * (219 / 161)
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.scrollDirection = .vertical
        
        $0.collectionViewLayout = layout
        $0.backgroundColor = .clear
    }
    
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
    
    // MARK: - Methods
    
    private func setUI() {
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        addSubviews(
            HStackView,
            itemCollectionView
        )
    }
    
    private func setLayout() {
        
        HStackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(48)
        }
        
        itemCollectionView.snp.makeConstraints {
            $0.top.equalTo(HStackView.snp.bottom)
            $0.bottom.leading.trailing.edges.equalToSuperview()
        }
    }
    
    //    private func calculateCellHeight() -> CGFloat {
    //        let count = CGFloat(itemData.count)
    //        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
    //        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
    //    }
    
}
