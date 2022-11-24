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
    static var chatMessages: [ChatMessage] = [
            .init(text: """
                    <meta name='viewport' content='initial-scale=1.0'/>
                    <div>
                          <p>
                          <b>Lorem ipsum</b> is placeholder <i>commonly used</i> in the graphic, print, and publishing industries for
                          previewing layouts and visual mockups.
                      </p>
                      <p>
                          <iframe width='100%' height='140' src='https://www.youtube.com/embed/QbVrvCACg-o' title='YouTube video player'
                              frameborder='0'
                              allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
                              allowfullscreen></iframe>
                      </p>

                      <h2>An Unordered HTML List</h2>

                      <ul>
                          <li>Coffee</li>
                          <li>Tea</li>
                          <li>Milk</li>
                      </ul>

                      <h2>An Ordered HTML List</h2>

                      <ol>
                          <li>Coffee</li>
                          <li>Tea</li>
                          <li>Milk</li>
                      </ol>
                    </div>
                    """,
                  isIncoming: true, date: Date.dateFrom(customString: "13 Kas 2022")),
    ]
    static let chatMessages2: [ChatMessage] = [
        .init(text: """
              <meta name='viewport' content='initial-scale=1.0' />
                  <div style="color: white">
                      <p>
                          <b>Lorem ipsum</b> is placeholder <i>commonly used</i> in the graphic..
                      </p>
         </div>
                    
         """, isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
            .init(text: """
                  <meta name='viewport' content='initial-scale=1.0' />
                      <div style="color: white">
                          <p>
                              <b>Lorem ipsum</b> is placeholder <i>commonly used</i> in the graphic, print, and publishing industries for
                              previewing layouts and visual mockups.
                          </p>
             <div>
                                     <img src="https://developer.apple.com/swift/images/swift-og.png" width="100%" height="150" alt="Flowers in Chania">
                                   </div>
             </div>
                        
             """, isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
                .init(text: """
<meta name='viewport' content='initial-scale=1.0' />
     <div>
         <iframe width="100%" height="150" src="https://www.youtube.com/embed/mr6gjd73px4" title="YouTube video player"
             frameborder="0"
             allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
             allowfullscreen></iframe>
     </div>
""", isIncoming: true, date: Date.dateFrom(customString: "14 Kas 2022")),
            .init(text: "<meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='tr' dir='ltr'>Teknoloji alanında yurtdışında staj yapmak isteyen arkadaşlar, 2023 yılı yazı için stajyer alımı yapan teknoloji şirketlerinin listesine şuradan ulaşabilirsiniz: <a href='https://t.co/zI8DzIKJZI'>https://t.co/zI8DzIKJZI</a></p>&mdash; Fatih Yavuz (@fthdev) <a href='https://twitter.com/fthdev/status/1592807393985204224?ref_src=twsrc%5Etfw'>November 16, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script> ", isIncoming: false, date: Date()),
            .init(text: "<meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='tr' dir='ltr'>Bilecik&#39;te yıllar önce satın aldıkları araziye yaptıkları 38 evle köy oluşturup birlikte yaşayan emeklilermiş. Ne hayatlar var be <a href='https://t.co/sqFeMjFpX6'>pic.twitter.com/sqFeMjFpX6</a></p>&mdash; Önder Şeren (@onderseren) <a href='https://twitter.com/onderseren/status/1592845691994673152?ref_src=twsrc%5Etfw'>November 16, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>", isIncoming: true, date: Date()),
            .init(text:  "<meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='tr' dir='ltr'>Yap şovunu yazılımcı çocuk if else mif else switch case karıştır yaz bişiler soru sorma hadi aynen try catch resultante importante</p>&mdash; humeyra benli (@hmyrbnl) <a href='https://twitter.com/hmyrbnl/status/1592835667117019136?ref_src=twsrc%5Etfw'>November 16, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>", isIncoming: true, date: Date()),
            .init(text: "<meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='en' dir='ltr'>How an immune cell chases down and destroys bacteria:<a href='https://t.co/DzpXPhk6YG'>pic.twitter.com/DzpXPhk6YG</a></p>&mdash; Fascinating (@fasc1nate) <a href='https://twitter.com/fasc1nate/status/1592624492807073792?ref_src=twsrc%5Etfw'>November 15, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>", isIncoming: false, date: Date()),
            .init(text: "<meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='en' dir='ltr'>We’re building for the future, for better devex &amp; productivity.<br><br>Today, we are excited to announce Console 2.0, our new dashboard, completely reimagined from the ground up.<br><br>Join us NOW on Product Hunt👇🏻<a href='https://t.co/y5xKfW15Pw'>https://t.co/y5xKfW15Pw</a></p>&mdash; Appwrite (@appwrite) <a href='https://twitter.com/appwrite/status/1592566862956711937?ref_src=twsrc%5Etfw'>November 15, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>", isIncoming: false, date: Date())
            
    ]
}
//    static let chatMessages: [[ChatMessage]] = [
//        [
//            .init(text: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", isIncoming: true, date: Date.dateFrom(customString: "13 Kas 2022")),
//         .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "13 Kas 2022")),
//        ],
//        [
//            .init(text: "Duis aute irure dolor in reprehenderit in voluptate",isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
//            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "14 Kas 2022")),
//            .init(text: "😂😂😂", isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
//        ],
//        [
//            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "15 Kas 2022")),
//            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "15 Kas 2022")),
//            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "15 Kas 2022")),
//            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "15 Kas 2022")),
//        ],
//        [
//            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "16 Kas 2022")),
//            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "16 Kas 2022")),
//        ],
//        [
//            .init(text: "😂😂", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
//            .init(text: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
//            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
//            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "17 Kas 2022")),
//            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "17 Kas 2022")),
//        ],
//        [
//            .init(text: "😂😂😂", isIncoming: false, date: Date.dateFrom(customString: "18 Kas 2022")),
//            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "18 Kas 2022")),
//            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "18 Kas 2022")),
//            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "18 Kas 2022")),
//        ],
//        [
//            .init(text: "Ut enim ad minim veniam", isIncoming: true, date: Date.dateFrom(customString: "19 Kas 2022")),
//            .init(text: "Duis aute irure dolor in reprehenderit in voluptate", isIncoming: false, date: Date.dateFrom(customString: "19 Kas 2022")),
//            .init(text: "Excepteur", isIncoming: true, date: Date.dateFrom(customString: "19 Kas 2022")),
//            .init(text: "😂😂", isIncoming: true, date: Date.dateFrom(customString: "19 Kas 2022")),
//        ]
//    ]

//
//    .init(text: "<script>window.addEventListener('load', () => {document.body.style.backgroundColor = 'purple'}) </script> <meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='tr' dir='ltr'>Bilecik&#39;te yıllar önce satın aldıkları araziye yaptıkları 38 evle köy oluşturup birlikte yaşayan emeklilermiş. Ne hayatlar var be <a href='https://t.co/sqFeMjFpX6'>pic.twitter.com/sqFeMjFpX6</a></p>&mdash; Önder Şeren (@onderseren) <a href='https://twitter.com/onderseren/status/1592845691994673152?ref_src=twsrc%5Etfw'>November 16, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>", isIncoming: true, date: Date.dateFrom(customString: "13 Kas 2022")),
//   ],
//   [
//       .init(text: "<script>window.addEventListener('load', () => {document.body.style.backgroundColor = 'orange'}) </script> <meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='tr' dir='ltr'>Yap şovunu yazılımcı çocuk if else mif else switch case karıştır yaz bişiler soru sorma hadi aynen try catch resultante importante</p>&mdash; humeyra benli (@hmyrbnl) <a href='https://twitter.com/hmyrbnl/status/1592835667117019136?ref_src=twsrc%5Etfw'>November 16, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>",isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
//       .init(text: "<script>window.addEventListener('load', () => {document.body.style.backgroundColor = 'yellow'}) </script> <meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='en' dir='ltr'>How an immune cell chases down and destroys bacteria:<a href='https://t.co/DzpXPhk6YG'>pic.twitter.com/DzpXPhk6YG</a></p>&mdash; Fascinating (@fasc1nate) <a href='https://twitter.com/fasc1nate/status/1592624492807073792?ref_src=twsrc%5Etfw'>November 15, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>", isIncoming: true, date: Date.dateFrom(customString: "14 Kas 2022")),
//       .init(text: "<script>window.addEventListener('load', () => {document.body.style.backgroundColor = 'blue'}) </script> <meta name='viewport' content='initial-scale=1.0'/><blockquote class='twitter-tweet'><p lang='en' dir='ltr'>We’re building for the future, for better devex &amp; productivity.<br><br>Today, we are excited to announce Console 2.0, our new dashboard, completely reimagined from the ground up.<br><br>Join us NOW on Product Hunt👇🏻<a href='https://t.co/y5xKfW15Pw'>https://t.co/y5xKfW15Pw</a></p>&mdash; Appwrite (@appwrite) <a href='https://twitter.com/appwrite/status/1592566862956711937?ref_src=twsrc%5Etfw'>November 15, 2022</a></blockquote> <script async src='https://platform.twitter.com/widgets.js' charset='utf-8'></script>", isIncoming: false, date: Date.dateFrom(customString: "14 Kas 2022")),
//   ]
