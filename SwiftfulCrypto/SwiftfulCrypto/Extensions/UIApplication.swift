//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/13/24.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
