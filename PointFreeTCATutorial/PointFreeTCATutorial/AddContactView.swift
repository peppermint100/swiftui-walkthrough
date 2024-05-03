//
//  AddContactView.swift
//  PointFreeTCATutorial
//
//  Created by peppermint100 on 5/3/24.
//
import SwiftUI
import ComposableArchitecture

struct AddContactView: View {
  @Bindable var store: StoreOf<AddContactFeature>

  var body: some View {
    Form {
      TextField("Name", text: $store.contact.name.sending(\.setName))
      Button("Save") {
        store.send(.saveButtonTapped)
      }
    }
    .toolbar {
      ToolbarItem {
        Button("Cancel") {
          store.send(.cancelButtonTapped)
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    AddContactView(
      store: Store(
        initialState: AddContactFeature.State(
          contact: Contact(
            id: UUID(),
            name: "Blob"
          )
        )
      ) {
        AddContactFeature()
      }
    )
  }
}
