//
//  ContactFeature.swift
//  PointFreeTCATutorial
//
//  Created by peppermint100 on 5/3/24.
//

import Foundation
import ComposableArchitecture


struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}


@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
//        @Presents var addContact: AddContactFeature.State?
//        @Presents var alert: AlertState<Action.Alert>?
        var contacts: IdentifiedArrayOf<Contact> = []
        @Presents var destination: Destination.State?
        var path = StackState<ContactDetailFeature.State>()
    }
    enum Action {
        case addButtonTapped
        case deleteButtonTapped(id: Contact.ID)
//        case addContact(PresentationAction<AddContactFeature.Action>)
//        case alert(PresentationAction<Alert>)
        case destination(PresentationAction<Destination.Action>)
        case path(StackAction<ContactDetailFeature.State, ContactDetailFeature.Action>)
        
        enum Alert: Equatable {
            case confirmDeletion(id: Contact.ID)
        }
    }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.destination = .addContact(
                    AddContactFeature.State (
                        contact: Contact(id: UUID(), name: "")
                    )
                )
//                state.addContact = AddContactFeature.State(
//                    contact: Contact(id: UUID(), name: "")
//                )
                return .none
                //            case .addContact(.presented(.delegate(.cancel))):
                //                state.addContact = nil
                //                return .none
                
                
//            case .addContact(.presented(.delegate(.saveContact(let contact)))):
            case .destination(.presented(.addContact(.delegate(.saveContact(let contact))))):
                state.contacts.append(contact)
                //                state.addContact = nil
                return .none
            case .deleteButtonTapped(let id):
//                state.alert = 
                state.destination = .alert(
                AlertState {
                    TextState("Are you sure?")
                } actions: {
                    ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                        TextState("Delete")
                    }
                })
                return .none
            case let .path(.element(id: id, action: .delegate(.confirmDeletion))):
                guard let detailState = state.path[id: id] else { return .none }
                state.contacts.remove(id: detailState.contact.id)
                return .none
//            case .alert(.presented(.confirmDeletion(let id))):
            case .destination(.presented(.alert(.confirmDeletion(let id)))):
                state.contacts.remove(id: id)
                return .none
            case .destination:
                return .none
            case .path:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
        .forEach(\.path, action: \.path) {
            ContactDetailFeature()
        }
//        .ifLet(\.$addContact, action: \.addContact) {
//            AddContactFeature()
//        }
//        .ifLet(\.$alert, action: \.alert)
    }
}

extension ContactsFeature {
    
    @Reducer(state: .equatable)
    enum Destination {
        case addContact(AddContactFeature)
        case alert(AlertState<ContactsFeature.Action.Alert>)
    }
}
