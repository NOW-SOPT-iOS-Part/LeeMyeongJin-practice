//
//  ChatViewController.swift
//  34th sopt 1th Seminar
//
//  Created by 이명진 on 4/20/24.
//

import Foundation

import UIKit

final class ChatViewController: UIViewController {
    
    private let chatList = ChatModel.dummy()
    
    // MARK: - UIComponents
    
    private let chatView = ChatView()
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = chatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setRegister()
    }
    
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        
    }
    
    private func setLayout() {
        
    }
    
    private func setDelegate() {
        chatView.chatTableView.delegate = self
        chatView.chatTableView.dataSource = self
    }
    
    private func setRegister() {
        chatView.chatTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.className)
    }
    
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}


extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = chatView.chatTableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.className, for: indexPath)
                as? ChatTableViewCell else { return UITableViewCell() }

        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
