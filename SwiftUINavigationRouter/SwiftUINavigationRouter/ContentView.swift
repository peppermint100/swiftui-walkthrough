//
//  ContentView.swift
//  SwiftUINavigationRouter
//
//  Created by peppermint100 on 5/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var router: NavigationRouter
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List {
                Section(header: Text("Coffee Menu")) {
                    ForEach(Coffee.all) { coffee in
                        NavigationLink(value: Route.cafeMenu(item: coffee), label: {
                            Text(coffee.name)
                        })
                    }
                }
                
                Section(header: Text("Dessert Menu")) {
                    ForEach(Dessert.all) { dessert in
                        NavigationLink(value: Route.cafeMenu(item: dessert), label: {
                            Text(dessert.name)
                        })
                    }
                }
            }
            .navigationTitle("Cafe Menu")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .cafeMenu(let item):
                    switch item {
                    case is Coffee:
                        CoffeeDetailView(coffee: item as! Coffee)
                    case is Dessert:
                        DessertDetailView(dessert: item as! Dessert)
                    default:
                        EmptyView()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        router.push(to: Route.cafeMenu(item: Coffee.all.randomElement()!))
                    }, label: {
                        Text("Random Coffee")
                            .foregroundStyle(.blue)
                    })
                    .foregroundStyle(.black)
                    .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationRouter())
}
