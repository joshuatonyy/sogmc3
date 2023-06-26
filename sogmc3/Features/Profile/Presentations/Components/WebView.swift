//
//  WebView.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let publicAccessToken: String
    let userID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
//        webView.navigationDelegate = context.coordinator
        
        guard var urlComponents = URLComponents(string: "https://cdn.onebrick.io/sandbox-widget/v1/")
        else { return webView }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "accessToken", value: publicAccessToken),
            URLQueryItem(name: "user_id", value: userID),
            URLQueryItem(name: "redirect_url", value: "https://sogserver-production.up.railway.app/redirectURL"),
        ]
        
        guard let url = urlComponents.url else { return webView }
        let request = URLRequest(url: url)
        webView.load(request)
        
        print(url)
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {}
    
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
