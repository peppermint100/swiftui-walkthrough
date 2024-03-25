//
//  CreateView.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/22/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focusedField: Field?
    @StateObject private var vm = CreateViewModel()
    let successfulAction: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    firstname
                    lastname
                    job
                } footer: {
                    if case .validation(let err) = vm.error,
                       let desc = err.errorDescription {
                        Text(desc)
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    submit
                }
            }
            .disabled(vm.state == .submitting)
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    done
                }
            }
            .onChange(of: vm.state) { formState in
                if formState == .successful {
                    dismiss()
                    successfulAction()
                }
            }
            .alert(isPresented: $vm.hasError, error: vm.error) {}
            .overlay {
                if vm.state == .submitting {
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    CreateView {}
}

extension CreateView {
    enum Field: Hashable {
        case firstName
        case lastName
        case job
    }
}

private extension CreateView {
    
    var done: some View {
        Button("Done") {
            dismiss()
        }
    }
    
    var firstname: some View {
        TextField("First name", text: $vm.person.firstName)
            .focused($focusedField, equals: .firstName)
    }
    
    var lastname: some View {
        TextField("Last name", text: $vm.person.lastName)
            .focused($focusedField, equals: .lastName)
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
            .focused($focusedField, equals: .job)
    }
    
    var submit: some View {
        Button("Submit") {
            vm.create()
            focusedField = nil
        }
    }
}
