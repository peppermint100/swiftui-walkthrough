//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/12/24.
//

import Foundation

/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 60800,
     "market_cap": 1197548787505,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1276752298751,
     "total_volume": 9789011925,
     "high_24h": 61427,
     "low_24h": 60532,
     "price_change_24h": -189.344065451493,
     "price_change_percentage_24h": -0.31046,
     "market_cap_change_24h": -2817607798.87671,
     "market_cap_change_percentage_24h": -0.23473,
     "circulating_supply": 19697262,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 73738,
     "ath_change_percentage": -17.41774,
     "ath_date": "2024-03-14T07:10:36.635Z",
     "atl": 67.81,
     "atl_change_percentage": 89702.90831,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-05-12T07:31:56.857Z",
     "sparkline_in_7d": {
       "price": [63207.7402424975, 63397.700563612, 63765.0924376795, 63683.490844069, 63752.8137866948, 63731.1704466881, 63861.7157721262, 63735.6344016566, 64108.6497365335, 64156.0514401762, 64396.4439166226, 64279.8451504073, 64196.8576854336, 63925.745831577, 63838.3578202111, 63757.9483644491, 63800.4164271342, 63880.7152931481, 64090.0964256939, 64239.5207252965, 64142.8459746707, 63856.6788249356, 63835.416590741, 64128.6802814791, 64128.1831461371, 64317.4638424195, 64531.2018888309, 65154.7003956532, 65138.1608688222, 64073.7013683993, 64248.9325807796, 63412.0987017822, 63910.4618474974, 63276.7791293284, 63679.7789523358, 63246.9503777439, 63241.7606571449, 63412.3810764533, 63138.4251455909, 63321.0276546403, 63503.0843509618, 63494.7795387161, 63159.4137703426, 63512.3017853216, 63881.4539115781, 63697.2808514363, 63249.4234864935, 63451.3771784011, 63496.7681790353, 63632.8984832694, 63663.8188762857, 64212.1970929267, 64119.7199838509, 64116.1292744879, 63468.9968698288, 63703.3694756043, 63188.032370602, 63924.4276117444, 63750.2153575109, 63589.7269189421, 63386.4537505125, 63144.9805689717, 63003.2535928001, 62979.3616119717, 63009.7928337125, 62888.9023410946, 62397.5171431007, 62599.8635087531, 62680.9518482707, 62763.1735062842, 62910.513784573, 62390.0556795153, 62656.5423107705, 62500.0404697605, 62182.6360348495, 62322.5878515551, 62263.561792346, 62434.3178120837, 62230.5295423898, 62234.8425865664, 62485.4807348045, 62657.1964884247, 62205.3502250828, 62329.8136632153, 62585.2400402187, 62470.0317559823, 62168.5147148017, 61576.1266763439, 61470.4317416218, 61191.6142999104, 61188.1710927935, 61416.1937566139, 61538.6100534731, 61645.6367859896, 61655.4176801726, 61457.1399930941, 61589.88582762, 61652.1601079964, 61198.7719546398, 61203.0958264543, 61163.4648862258, 60901.5287615442, 61035.9710585606, 61500.6251847504, 61147.0792016121, 61360.5451288099, 62115.8429252008, 61862.8578774887, 61921.0761546475, 62194.4714713872, 62435.9544700427, 62637.3618183673, 62521.5739662949, 63284.3309209575, 63065.3309864049, 62825.749271725, 62824.698710225, 62892.1734464917, 62940.2696609694, 62935.8722878058, 62765.3729011503, 63166.6664011365, 63067.1548898661, 63002.4297788449, 63108.8487858934, 62982.4209401701, 63293.9802112634, 63000.2169478931, 63077.5071061762, 61168.275354042, 60904.1022017904, 61096.2896932192, 60380.2791835582, 60728.492559952, 60848.5720063215, 60484.471181131, 60682.9124221555, 60832.766987638, 60789.5675062635, 60773.5499464633, 60860.9722334381, 60870.6918557564, 60705.1042835674, 60775.3603667608, 60913.1749796905, 60954.9312057841, 61040.8585189548, 60848.689096014, 60830.0752396733, 60779.448381933, 60667.3093359156, 60702.5334999328, 60940.4669908477, 60833.802626696, 61158.0412548479, 61133.6382123069, 61094.5235319565, 61201.3466217221, 61111.8454324027, 60980.7457399014, 60911.590451049, 60900.9121785845, 60794.6299699482, 60970.8442599656, 60852.2443125618, 60918.9287149022, 60899.8805263828, 61092.7823102755]
     },
     "price_change_percentage_24h_in_currency": -0.310455966310358
   }
 */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}
