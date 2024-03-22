//
//  PeopleView.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/22/24.
//

import SwiftUI

struct PeopleView: View {
    
    private let columns = Array(
        repeating: GridItem(.flexible()), count: 2)
    
    @State private var users: [User] = []
    @State private var shouldShowCreate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                background
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(users, id: \.id) { user in
                            NavigationLink{
                                DetailView()
                            } label: {
                                PersonItemView(user: user)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    create
                }
            }
            .onAppear {
                NetworkingManager.shared.request("https://reqres.in/api/users",
                                                 type: UsersResponse.self) { res in
                    switch res {
                    case .success(let response):
                        users = response.data
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            .sheet(isPresented: $shouldShowCreate) {
                CreateView()
            }
        }
    }
}

#Preview {
    PeopleView()
}

private extension PeopleView {
    var background: some View {
        Theme.background
            .ignoresSafeArea(edges: .top)
    }
    
    var create: some View {
        Button(action: {
            shouldShowCreate.toggle()
        }, label: {
            Symbols.plus
                .font(.system(.headline, design: .rounded))
                .bold()
        })
    }
}
