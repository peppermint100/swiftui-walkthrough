//
//  CreateView.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/22/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = CreateViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                
                firstname
                lastname
                job
                
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
    CreateView()
}

private extension CreateView {
    
    var done: some View {
        Button("Done") {
            dismiss()
        }
    }
    
    var firstname: some View {
        TextField("First name", text: $vm.person.firstName)
    }
    
    var lastname: some View {
        TextField("Last name", text: $vm.person.lastName)
    }
    
    var job: some View {
        TextField("Job", text: $vm.person.job)
    }
    
    var submit: some View {
        Button("Submit") {
            vm.create()
        }
    }
}
