//
//  ContentView.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
            .onAppear {
                print("User response")
                dump(
                    try? StaticJSONMapper.decode(
                        file: "UsersStaticData", type: UsersResponse.self)
                )
                
                print("Single User response")
                dump(
                    try? StaticJSONMapper.decode(
                        file: "SingleUserData", type: UserDetailResponse.self)
                )
            }
    }
}

#Preview {
    ContentView()
}
