//
//  String.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/24/24.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
