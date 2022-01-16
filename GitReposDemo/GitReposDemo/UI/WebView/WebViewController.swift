//
//  WebViewController.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 16/01/2022.
//

import WebKit

class WebViewController: UIViewController {
    
    // MARK: - Outlets
    
    lazy var vWebView: WKWebView = {
        let view = WKWebView()
        view.navigationDelegate = self
        view.uiDelegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    //MARK: - Local variables
    
    var contentUrl : URL?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        prepareData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Prepare data
    
    private func prepareData() {
        if let contentUrl = contentUrl {
            vWebView.load(URLRequest(url: contentUrl))
        }
    }
    
    // MARK: - UI Customization
    
    private func customizeUI() {
        
        // Create web view
        self.view.addSubview(vWebView)
        self.view.leftAnchor.constraint(equalTo: vWebView.leftAnchor).isActive = true
        self.view.topAnchor.constraint(equalTo: vWebView.topAnchor).isActive = true
        self.view.rightAnchor.constraint(equalTo: vWebView.rightAnchor).isActive = true
        self.view.bottomAnchor.constraint(equalTo: vWebView.bottomAnchor).isActive = true
        
        // Setup activity indicator
        self.view.addSubview(loadingIndicator)
        self.view.centerXAnchor.constraint(equalTo: loadingIndicator.centerXAnchor).isActive = true
        self.view.centerYAnchor.constraint(equalTo: loadingIndicator.centerYAnchor).isActive = true
    }
    
    private func showErrorMessageInWebview(_ errorText: String) {
        DispatchQueue.main.async {
            let errorMessage = "<html><head></head><body><p>\(errorText)</p></body></html>"
            self.vWebView.loadHTMLString(errorMessage, baseURL: nil)
        }
    }
}

extension WebViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.showErrorMessageInWebview("An error occured during loading of page...")
        }
    }
}

