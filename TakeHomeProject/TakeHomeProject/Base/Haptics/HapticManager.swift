//
//  HapticManager.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/25/24.
//

import UIKit

fileprivate final class HapticManager {
    static let shared = HapticManager()
    private init() {}
    
    private let feedback = UINotificationFeedbackGenerator()
    
    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
        feedback.notificationOccurred(notification)
    }
}

func haptic(_ notification: UINotificationFeedbackGenerator.FeedbackType) {
    if UserDefaults.standard.bool(forKey: UserDefaultsKey.hapticsEnabled) {
        HapticManager.shared.trigger(notification)
    }
}
