//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/12/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticsModel] = [
        DeveloperPreview.instance.stat1,
        DeveloperPreview.instance.stat2,
        DeveloperPreview.instance.stat3,
        DeveloperPreview.instance.stat1,
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map (filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        let filteredCoins = coins.filter {
            $0.name.lowercased().contains(lowercasedText)
            || $0.id.lowercased().contains(lowercasedText)
            || $0.symbol.lowercased().contains(lowercasedText)
        }
        
        return filteredCoins
    }
}
