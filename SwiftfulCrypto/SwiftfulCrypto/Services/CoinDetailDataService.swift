//
//  CoinDetailDataService.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/22/24.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    var coinSubscription: AnyCancellable?
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false&x_cg_demo_api_key=\(KeyConstant.apiKey)")
        else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion
                ,receiveValue: { [weak self] returnedCoinDetails in
                    self?.coinDetails = returnedCoinDetails
                    self?.coinSubscription?.cancel()
                })
    }
}
