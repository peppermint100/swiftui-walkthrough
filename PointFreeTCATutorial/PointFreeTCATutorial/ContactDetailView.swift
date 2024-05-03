//
//  ContactDetailView.swift
//  PointFreeTCATutorial
//
//  Created by peppermint100 on 5/3/24.
//

import SwiftUI
import ComposableArchitecture

struct ContactDetailView: View {
    
    @Bindable var store: StoreOf<ContactDetailFeature>
    
    var body: some View {
        Form {
            Button("Delete") {
                store.send(.deleteButtonTapped)
            }
        }
        .navigationTitle(Text(store.contact.name))
        .alert($store.scope(state: \.alert, action: \.alert))
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(
            store: Store(
                initialState: ContactDetailFeature.State(
                    contact: Contact(id: UUID(), name: "Pepper")
                )
            ) {
                ContactDetailFeature()
            }
        )
    }
}
