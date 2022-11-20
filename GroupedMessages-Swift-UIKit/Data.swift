//
//  Data.swift
//  GroupedMessages-Swift-UIKit
//
//  Created by Samet Koyuncu on 19.11.2022.
//

import Foundation

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFrom(customString: String) -> Date {
        let dateFormetter = DateFormatter()
        dateFormetter.dateFormat = "dd MMM yyyy"
        
        return dateFormetter.date(from: customString) ?? Date()
    }
}

struct Data {
    static let chatMessages: [[ChatMessage]] = [
        [
            .init(text: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", isIncoming: true, date: Date.dateFrom(customString: "13 Kas 2022")),
         .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "13 Kas 2022")),
        ],
        [
            .init(text: "Duis aute irure dolor in reprehenderit in voluptate",isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "14 Kas 2022")),
            .init(text: "😂😂😂", isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
        ],
        [
            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "15 Kas 2022")),
            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "15 Kas 2022")),
            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "15 Kas 2022")),
            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "15 Kas 2022")),
        ],
        [
            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "16 Kas 2022")),
            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "16 Kas 2022")),
        ],
        [
            .init(text: "😂😂", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
            .init(text: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "17 Kas 2022")),
            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
        ],
        [
            .init(text: "😂😂😂", isIncoming: false, date: Date.dateFrom(customString: "18 Kas 2022")),
            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "18 Kas 2022")),
            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "18 Kas 2022")),
            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "18 Kas 2022")),
        ],
        [
            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "19 Kas 2022")),
            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "19 Kas 2022")),
            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "19 Kas 2022")),
            .init(text: "😂😂", isIncoming: true, date: Date.dateFrom(customString: "19 Kas 2022")),
        ]
    ]
}
