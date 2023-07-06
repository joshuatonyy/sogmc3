//
//  ContentView.swift
//  sogmc3
//
//  Created by Joshua on 18/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar2()
            .task {
                let service = ProfileRemoteDataSource()
                let result = await service.getPublicAccessToken()
                switch result {
                case .success(let success):
                    dump(success)
                case .failure(let failure):
                    dump(failure)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
