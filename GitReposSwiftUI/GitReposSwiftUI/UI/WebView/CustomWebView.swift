//
//  CustomWebView.swift
//  GitReposSwiftUI
//
//  Created by Andrej Lukes on 16/01/2022.
//

import SwiftUI
import WebKit

struct CustomWebView : UIViewRepresentable {
    
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

#if DEBUG
struct CustomWebView_Previews : PreviewProvider {
    static var previews: some View {
        CustomWebView(url: URL(string: "https://www.google.com")!)
    }
}
#endif
