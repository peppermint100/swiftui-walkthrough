//
//  PeopleViewModel.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/23/24.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    
    @Published private(set) var users: [User] = []
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    @Published private(set) var isLoading = false
    
    func fetchUsers() {
        isLoading = true
        NetworkingManager.shared.request("https://reqres.in/api/users?delay=1",
                                         type: UsersResponse.self) { [weak self] res in
            DispatchQueue.main.async {
                defer { self?.isLoading = false}
                switch res {
                case .success(let response):
                    self?.users = response.data
                case .failure(let error):
                    self?.hasError = true
                    self?.error = error as? NetworkingManager.NetworkingError
                }
            }
        }
    }
}
