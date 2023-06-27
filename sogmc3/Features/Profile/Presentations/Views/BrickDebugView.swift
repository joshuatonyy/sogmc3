//
//  BrickDebugView.swift.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import SwiftUI

struct BrickDebugView: View {
    
    @State private var publicAccessToken: String?
    
    @State private var showLoadingIndicator = false
    
    @State private var showBrickWidget = false
    
    private let profileRepository = ProfileRepository()
    
    var body: some View {
        VStack(spacing: 32) {
            
            if showLoadingIndicator {
                ProgressView()
            }
            
            Text("Debug:")
            
            Button {
                Task {
                    showLoadingIndicator = true
                    try? await profileRepository.fetchPublicAcessToken()
                    showLoadingIndicator = false
                }
            } label: {
                Text("Fetch public access token from network")
            }
            
            Button {
                Task {
                    publicAccessToken = try? profileRepository.readPublicAccessToken()
                    showBrickWidget = true
                }
            } label: {
                Text("Read public access token from keychain")
            }
            
            Text("public accessToken: \(publicAccessToken ?? "empty")")
            
        }
        .sheet(isPresented: $showBrickWidget, onDismiss: {
            print("sheet is dismissed")
            Task {
                do {
                    try await profileRepository.fetchUserAccessToken(for: "mock-user-1")
                } catch {
                    print("error:", error)
                }
            }
        }) {
            if let publicAccessToken {
                WebView(publicAccessToken: publicAccessToken, userID: "mock-user-1")
            }
        }
    }
}


struct BrickDebugView_Previews: PreviewProvider {
    static var previews: some View {
        BrickDebugView()
    }
}
