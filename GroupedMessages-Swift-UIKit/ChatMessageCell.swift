//
//  ChatMessageCell.swift
//  GroupedMessages-Swift-UIKit
//
//  Created by Samet Koyuncu on 19.11.2022.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    static let identifier = "ChatMessageCellId"
    
    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
        //messageLabel.backgroundColor = .red
        
        bubbleBackgroundView.backgroundColor = .cyan
        bubbleBackgroundView.layer.cornerRadius = 8
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let messageLabelContraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            messageLabel.widthAnchor.constraint(equalToConstant: 250)
        ]
        
        let bubbleBackgroundViewContraints = [
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
        ]
        
        NSLayoutConstraint.activate(messageLabelContraints)
        NSLayoutConstraint.activate(bubbleBackgroundViewContraints)
    }
}
