//
//  StatisticView.swift
//  SwiftfulCrypto
//
//  Created by peppermint100 on 5/13/24.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview {
    Group {
        StatisticView(
            stat: DeveloperPreview.instance.stat1
        )
        
        StatisticView(
            stat: DeveloperPreview.instance.stat2
        )
        
        StatisticView(
            stat: DeveloperPreview.instance.stat3
        )
    }
}



