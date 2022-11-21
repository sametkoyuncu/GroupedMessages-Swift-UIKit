//
//  ViewController.swift
//  GroupedMessages-Swift-UIKit
//
//  Created by Samet Koyuncu on 19.11.2022.
//

import UIKit
import WebKit

class ViewController: UITableViewController {
    var counter = 0
    let cellId = "id"
    var contentHeights =  [CGFloat](repeating: 0.0, count: Data.chatMessages.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
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

        cell.messageLabel.tag = indexPath.row
        cell.messageLabel.navigationDelegate = self
        cell.messageLabel.frame = CGRect(x: 0, y: 0, width: 250, height: contentHeights[indexPath.row])
        
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
        tableView.reloadRows(at: [IndexPath(row: webView.tag, section: 0)], with: .automatic)
        tableView.scrollToRow(at: IndexPath(row: webView.tag, section: 0), at: .bottom, animated: true)
    }
}

extension ViewController {
    func addNewMessageToChat() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            self.contentHeights.append(0.0)
            Data.chatMessages.append(Data.chatMessages2[self.counter])
            
            DispatchQueue.main.async {
                print("medet")
                self.tableView.reloadData()
                print("medet \(Data.chatMessages.count)")
                let indexPath = IndexPath(row: Data.chatMessages.count - 1, section: 0)
                
            }
           
            self.counter += 1
            if self.counter == Data.chatMessages2.count {
                print("ayva bitti")
                timer.invalidate()
            }
        }
    }
}
