//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/24/24.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let coinbaseURL = URL(string: "https://www.coinbase.com")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let githubURL = URL(string: "https://github.com/peppermint100/swiftui-walkthrough/blob/master/TakeHomeProject/TakeHomeProject/Features/Create/Views/CreateView.swift")!
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Google")) {
                    VStack(alignment: .leading) {
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text("This app was made by following SwiftfulThinking course. It uses MVVM architecture, Combine and CoreData")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(Color.theme.accent)
                    }
                    .padding(.vertical)
                    
                    Link("Google", destination: defaultURL)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
