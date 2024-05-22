//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/22/24.
//

import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
