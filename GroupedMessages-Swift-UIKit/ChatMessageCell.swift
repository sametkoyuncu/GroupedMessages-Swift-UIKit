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
    
    let bubbleBackgroundView = UIView()
    let webView = WKWebView()
    
    var bubbleBackgroundViewLeadingConstraint: NSLayoutConstraint!
    var bubbleBackgroundViewTrailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet{
            webView.loadHTMLString(chatMessage.text, baseURL: nil)
            
            // set colors
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .systemGreen
            
            // set constraints for messageLabel
            switch chatMessage.isIncoming {
            case true:
                bubbleBackgroundViewLeadingConstraint.isActive = true
                bubbleBackgroundViewTrailingConstraint.isActive = false
            case false:
                bubbleBackgroundViewLeadingConstraint.isActive = false
                bubbleBackgroundViewTrailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear

        addSubview(bubbleBackgroundView)
        bubbleBackgroundView.addSubview(webView)
        
        bubbleBackgroundView.layer.cornerRadius = 8

        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let bubbleBackgroundViewContraints = [
            bubbleBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            bubbleBackgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: 280),
        ]
        
        let webViewContraints = [
            webView.topAnchor.constraint(equalTo:  bubbleBackgroundView.topAnchor, constant: 4),
            webView.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -10),
            webView.leadingAnchor.constraint(equalTo: bubbleBackgroundView.leadingAnchor, constant: 4),
            webView.trailingAnchor.constraint(equalTo: bubbleBackgroundView.trailingAnchor, constant: -4)
        ]
        
        NSLayoutConstraint.activate(bubbleBackgroundViewContraints)
        NSLayoutConstraint.activate(webViewContraints)
        
        
        
        bubbleBackgroundViewLeadingConstraint = bubbleBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        
        bubbleBackgroundViewTrailingConstraint = bubbleBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
    
    }
}
