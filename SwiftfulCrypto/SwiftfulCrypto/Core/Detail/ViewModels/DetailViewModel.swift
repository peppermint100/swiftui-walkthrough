//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/22/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
