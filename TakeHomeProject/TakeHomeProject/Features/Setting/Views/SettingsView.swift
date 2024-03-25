//
//  SettingsView.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/25/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage(UserDefaultsKey.hapticsEnabled) private var isHapticsEnabled: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                haptics
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}

private extension SettingsView {
    var haptics: some View {
        Toggle("Enable haptics", isOn: $isHapticsEnabled)
    }
}
