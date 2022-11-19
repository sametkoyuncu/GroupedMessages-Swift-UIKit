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
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.textMessages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as! ChatMessageCell
        cell.messageLabel.numberOfLines = 0
        cell.messageLabel.text = Data.textMessages[indexPath.row]
        
        return cell
    }
}

