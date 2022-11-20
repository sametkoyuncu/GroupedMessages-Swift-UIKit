//
//  ViewController.swift
//  GroupedMessages-Swift-UIKit
//
//  Created by Samet Koyuncu on 19.11.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "id"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        Data.chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            font = UIFont.boldSystemFont(ofSize: 14)
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            
            return CGSize(width: originalContentSize.width + 24,
                          height: height)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = Data.chatMessages[section].first {
            // date label
            let dateLabel = DateHeaderLabel()
            
            // date format
            let dateFormetter = DateFormatter()
            dateFormetter.dateFormat = "dd MMM yyyy"
            let dateString = dateFormetter.string(from: firstMessageInSection.date)
            dateLabel.text = dateString
            
            // container view
            let containerView = UIView()
            containerView.addSubview(dateLabel)
            
            // label constraints
            let dateLabelContraints = [
                dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                dateLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            ]
            NSLayoutConstraint.activate(dateLabelContraints)
            
            return containerView
        }
       return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.chatMessages[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as! ChatMessageCell
        let chatMessage = Data.chatMessages[indexPath.section][indexPath.row]
        cell.messageLabel.numberOfLines = 0
        
        cell.chatMessage = chatMessage
        return cell
    }
}

