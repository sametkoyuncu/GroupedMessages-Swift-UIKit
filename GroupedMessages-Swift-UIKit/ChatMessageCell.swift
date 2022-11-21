//
//  ChatMessageCell.swift
//  GroupedMessages-Swift-UIKit
//
//  Created by Samet Koyuncu on 19.11.2022.
//

import UIKit
import WebKit

class ChatMessageCell: UITableViewCell {
    static let identifier = "ChatMessageCellId"
    var contentHeights : [CGFloat] = []
    
//    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    let messageLabel = WKWebView()
    
    var messageLabelLeadingConstraint: NSLayoutConstraint!
    var messageLabelTrailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet{
            messageLabel.loadHTMLString(chatMessage.text, baseURL: nil)
            
            // set colors
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .systemGreen
          //  messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            // set constraints for messageLabel
            switch chatMessage.isIncoming {
            case true:
                messageLabelLeadingConstraint.isActive = true
                messageLabelTrailingConstraint.isActive = false
            case false:
                messageLabelLeadingConstraint.isActive = false
                messageLabelTrailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        messageLabel.isOpaque = false
        messageLabel.backgroundColor = .clear
        messageLabel.scrollView.backgroundColor = .clear

        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
        
        bubbleBackgroundView.layer.cornerRadius = 16
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let messageLabelContraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
        ]
        
        let bubbleBackgroundViewContraints = [
            bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
            bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8),
        ]
        
        NSLayoutConstraint.activate(messageLabelContraints)
        NSLayoutConstraint.activate(bubbleBackgroundViewContraints)
        
        
        messageLabelLeadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        
        messageLabelTrailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
    
    }
}
