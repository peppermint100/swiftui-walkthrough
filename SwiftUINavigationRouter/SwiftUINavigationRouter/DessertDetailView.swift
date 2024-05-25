//
//  DessertDetailView.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import SwiftUI

struct DessertDetailView: View {
    
    @EnvironmentObject private var router: NavigationRouter
    let dessert: Dessert
    
    var body: some View {
        Text("\(dessert.name)")
            .font(.headline)
            .navigationTitle("Dessert")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        router.pop()
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                    .foregroundStyle(.black)
                    .font(.headline)
                }
            }
    }
}

#Preview {
    DessertDetailView(dessert: Dessert.all.first!)
        .environmentObject(NavigationRouter())
}
