//
//  CoffeeDetailView.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import SwiftUI

struct CoffeeDetailView: View {
    
    @EnvironmentObject private var router: NavigationRouter
    let coffee: Coffee
    
    var body: some View {
        Text("\(coffee.name)")
            .font(.headline)
            .navigationTitle("Coffee")
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
    CoffeeDetailView(coffee: Coffee.all.first!)
        .environmentObject(NavigationRouter())
}
