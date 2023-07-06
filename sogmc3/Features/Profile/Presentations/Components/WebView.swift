//
//  WebView.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import SwiftUI
import WebKit

struct RedirectURLReponse: Codable {
    let redirectURL: String
}

struct WebView: UIViewRepresentable {
    
//    let publicAccessToken: String
    let userID: String
//    var webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
//        let webView = WKWebView()
//        webView.navigationDelegate = context.coordinator
        
//        guard var urlComponents = URLComponents(string: "https://cdn.onebrick.io/sandbox-widget/v1/")
//        else { return webView }
//
//        urlComponents.queryItems = [
//            URLQueryItem(name: "accessToken", value: publicAccessToken),
//            URLQueryItem(name: "user_id", value: userID),
//            URLQueryItem(name: "redirect_url", value: "https://sogserver-production.up.railway.app/redirectURL"),
//        ]
//
//        guard let webUrl = urlComponents.url else { return webView }
//        let webRequest = URLRequest(url: webUrl)
//        webView.load(webRequest)
//
//        print(webUrl)
        
        let webView = WKWebView()
        
        Task {
            let url = try! await getRedirectURL()
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        
    }
    
    func getRedirectURL() async throws -> URL {
        guard let url = URL(string: "https://sogserver-production.up.railway.app/redirect-url/\(userID)") else { throw RequestError.unknown }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let decodedResponse = try? decoder.decode(RedirectURLReponse.self, from: data) else {
            throw RequestError.decode
        }
        
        guard let webURL = URL(string: decodedResponse.redirectURL) else { throw RequestError.unknown }
        
        return webURL
    }
    
//    func makeCoordinator() -> Coordinator {
//        Coordinator()
//    }
    
//    class Coordinator: NSObject, WKNavigationDelegate {
//
//        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//            func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//                // Check if the navigation action is a POST request with a non-empty body
//                if navigationAction.request.httpMethod == "POST", let httpBody = navigationAction.request.httpBody {
//                    print("parsing..")
//                    do {
//                        // Parse the request body as JSON
//                        let json = try JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: Any]
//                        let institutionId = json?["institutionId"] as? String
//                        let username = json?["username"] as? String
//                        let password = json?["password"] as? String
//                        let redirectRefId = json?["redirectRefId"] as? String
//
//                    } catch {
//                        print("Error parsing request body: \(error)")
//                    }
//                }
//
//                // Allow the navigation action to proceed
//                decisionHandler(.allow)
//            }
//
//            print("fetchpage")
//
//               // Allow the navigation action to proceed
//               decisionHandler(.allow)
//           }
//
//    }
}
    


//struct WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebView(url: URL(string: "https://www.google.com/")!)
//    }
//}
