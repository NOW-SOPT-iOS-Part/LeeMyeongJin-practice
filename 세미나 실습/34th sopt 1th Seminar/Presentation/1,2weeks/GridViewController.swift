//
//  GridViewController.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/6/24.
//

import UIKit

import SnapKit
import Then

final class GridViewController: UIViewController {
    
    // MARK: - UIComponents
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = viewFactory(background: .red)
    private let orangeView = viewFactory(background: .orange)
    private let yellowView = viewFactory(background: .yellow)
    private let greenView = viewFactory(background: .green)
    private let blueView = viewFactory(background: .blue)
    private let purpleView = viewFactory(background: .purple)
    
    
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
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            redView,
            orangeView,
            yellowView,
            greenView,
            blueView,
            purpleView
        )
        
    }
    private func setLayout() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        let viewHeight = 337
        let viewWidth = UIScreen.main.bounds.width / 2
        
        redView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalTo(contentView)
            $0.height.equalTo(viewHeight)
            $0.width.equalTo(viewWidth)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.trailing.equalTo(contentView)
            $0.leading.equalTo(redView.snp.trailing)
            $0.height.equalTo(viewHeight)
            $0.width.equalTo(viewWidth)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(viewHeight)
            $0.width.equalTo(viewWidth)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.height.equalTo(viewHeight)
            $0.width.equalTo(viewWidth)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(viewHeight)
            $0.width.equalTo(viewWidth)
            $0.bottom.equalTo(contentView)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(blueView.snp.trailing)
            $0.height.equalTo(viewHeight)
            $0.width.equalTo(viewWidth)
            $0.bottom.equalTo(contentView)
        }
    }
    
}

// 협업 사이클
// Jira 사용
/// 기본기 탄탄
/// 기술 스택 이해도 !!! ⭐️
///  - 양이 아닌 질 적인 부분 !!
///  객체 지향 코드
/// 테스트 코드에서 RxSwfit를 사용하는 이유? Combine 이 iOS 13.0 버전 부터 사용 가능해서 그런가?
