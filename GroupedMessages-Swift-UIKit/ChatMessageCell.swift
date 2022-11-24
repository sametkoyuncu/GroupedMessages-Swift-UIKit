//
//  ChatMessageCell.swift
//  GroupedMessages-Swift-UIKit
//
//  Created by Samet Koyuncu on 19.11.2022.
//

import UIKit
import WebKit

protocol ChatMessageCellDelegate: AnyObject {
    func updateHeights()
}

class ChatMessageCell: UITableViewCell {
    static let identifier = "ChatMessageCellId"
    
    // vc delegate
    weak var delegate: ChatMessageCellDelegate?

    // veriables
    private var height: CGFloat = 0
    private var timerCounter: CGFloat = 0
    private var timer: Timer?
    
    let bubbleBackgroundView = UIView()
    let webView = WKWebView()
    
    var bubbleBackgroundViewLeadingConstraint: NSLayoutConstraint!
    var bubbleBackgroundViewTrailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet{
            webView.loadHTMLString(chatMessage.text, baseURL: nil)
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [self] timer in
                if self.height < self.webView.scrollView.contentSize.height {
                    self.height  = webView.scrollView.contentSize.height
                    self.delegate?.updateHeights()
                }
                
                self.timerCounter += 0.1
                if self.timerCounter > 10 {
                    self.resetTimerAndVeriables()
                }
            }
            
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
        webView.scrollView.isScrollEnabled = false

        addSubview(bubbleBackgroundView)
        bubbleBackgroundView.addSubview(webView)
        
        bubbleBackgroundView.layer.cornerRadius = 8

        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetTimerAndVeriables()
    }
    
    func configureConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let bubbleBackgroundViewContraints = [
            bubbleBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            bubbleBackgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: 280),
        ]
        
        let webViewContraints = [
            webView.topAnchor.constraint(equalTo:  bubbleBackgroundView.topAnchor, constant: 4),
            webView.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -4),
            webView.leadingAnchor.constraint(equalTo: bubbleBackgroundView.leadingAnchor, constant: 4),
            webView.trailingAnchor.constraint(equalTo: bubbleBackgroundView.trailingAnchor, constant: -4)
        ]
        
        NSLayoutConstraint.activate(bubbleBackgroundViewContraints)
        NSLayoutConstraint.activate(webViewContraints)
        
        bubbleBackgroundViewLeadingConstraint = bubbleBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        
        bubbleBackgroundViewTrailingConstraint = bubbleBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
    
    }
    
    private func resetTimerAndVeriables() {
        timer?.invalidate()
        self.height = 0
        self.timerCounter = 0
    }
}
