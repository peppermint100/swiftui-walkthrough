//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/13/24.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var markData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(
            string: "https://api.coingecko.com/api/v3/global?x_cg_demo_api_key=\(KeyConstant.apiKey)")
        else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .map { $0.data }
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion
                ,receiveValue: { [weak self] returnedData in
                    self?.markData = returnedData
                    self?.marketDataSubscription?.cancel()
                })
    }
}
