//
//  NewsResponse.swift
//  SwiftUICombineMVVMNewsApp
//
//  Created by peppermint100 on 3/26/24.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let description: String?
    let image: String?
    let date: Date?
}

extension Article {
    static var dummyData: Article {
        .init(
            author: "Praveena Somasundaram",
            url: "https://www.washingtonpost.com/climate-environment/2024/03/24/mountain-lion-attack-california/",
            source: "The Washington Post",
            title: "Mountain lion attack in northern California is first fatality in decades - The Washington Post",
            description: "A 21-year-old was killed and an 18-year-old injured when the pair, who are brothers, were attacked by a mountain lion in Georgetown, Calif., on Saturday, authorities said.",
            image: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/MSUJ52OSVZO4YGSTKNX2LN4B2M_size-normalized.jpg&w=1440",
            date: Date())
    }
}

