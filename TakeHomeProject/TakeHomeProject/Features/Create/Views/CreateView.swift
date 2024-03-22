//
//  CreateView.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/22/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    
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
            .navigationTitle("Create")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    done
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
        TextField("First name", text: .constant(""))
    }
    
    var lastname: some View {
        TextField("Last name", text: .constant(""))
    }
    
    var job: some View {
        TextField("Job", text: .constant(""))
    }
    
    var submit: some View {
        Button("Submit") {
        }
    }
}
