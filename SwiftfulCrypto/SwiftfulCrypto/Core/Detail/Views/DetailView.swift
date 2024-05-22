//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/22/24.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    let coin: CoinModel
    
    @StateObject var vm: DetailViewModel
    
    init(coin: CoinModel) {
        self.coin = coin
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}
