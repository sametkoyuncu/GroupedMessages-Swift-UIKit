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
    let cellId = "id"
    var contentHeights =  [CGFloat](repeating: 0.0, count: Data.chatMessages.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(red: 1.00, green: 0.97, blue: 0.92, alpha: 1.00)
        
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
        contentHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.chatMessages.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as! ChatMessageCell
        let chatMessage = Data.chatMessages[indexPath.row]

        cell.webView.tag = indexPath.row
        cell.webView.navigationDelegate = self
        
        cell.webView.frame = CGRect(x: 0, y: 0, width: 250, height: contentHeights[indexPath.row])
        
        cell.chatMessage = chatMessage
        return cell
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if (contentHeights[webView.tag] != 0.0)
        {
            return
        }
        
        contentHeights[webView.tag] = webView.scrollView.contentSize.height
        
        let indexPath = IndexPath(row: webView.tag, section: 0)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            self?.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

extension ViewController {
    func addNewMessageToChat() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            self.contentHeights.append(0.0)
            Data.chatMessages.append(Data.chatMessages2[self.indexCounter])
            
            let selectedIndexPath = IndexPath(row: Data.chatMessages.count - 1, section: 0)

            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [selectedIndexPath], with: .automatic)
            self.tableView.endUpdates()
           
            self.indexCounter += 1
            if self.indexCounter == Data.chatMessages2.count {
                timer.invalidate()
            }
        }
    }
}
