//
//  ViewController.swift
//  GroupedMessages-Swift-UIKit
//
//  Created by Samet Koyuncu on 19.11.2022.
//

import UIKit
import WebKit

class ViewController: UITableViewController {
    var indexCounter = 0 // for adding new messages to table
    var timerCounter = 0
    let cellId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        // tableView.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.92, alpha: 1.00)
        tableView.backgroundColor = UIColor(red: 0.64, green: 0.78, blue: 0.84, alpha: 0.90)
        
        addNewMessageToChat()
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = Data.chatMessages.first {
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let cell = tableView.cellForRow(at: indexPath) as? ChatMessageCell {
            return cell.webView.scrollView.contentSize.height + 20
        }
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.chatMessages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as! ChatMessageCell
        
        cell.delegate = self
        
        let chatMessage = Data.chatMessages[indexPath.row]
        cell.chatMessage = chatMessage
        
        return cell
    }
}

extension ViewController: ChatMessageCellDelegate {
    func updateHeights() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}

extension ViewController {
    func addNewMessageToChat() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            Data.chatMessages.append(Data.chatMessages2[self.indexCounter])
            
            let selectedIndexPath = IndexPath(row: Data.chatMessages.count - 1, section: 0)

            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [selectedIndexPath], with: .automatic)
            self.tableView.endUpdates()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.tableView.scrollToRow(at: IndexPath(row: Data.chatMessages.count - 1, section: 0), at: .bottom, animated: true)
            }
           
            self.indexCounter += 1
            if self.indexCounter == Data.chatMessages2.count {
                timer.invalidate()
            }
        }
    }
}
