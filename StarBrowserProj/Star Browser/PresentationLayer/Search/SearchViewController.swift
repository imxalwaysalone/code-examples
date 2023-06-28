//
//  SearchViewController.swift
//  Star Browser
//
//  Created by Arseni Khatsuk on 16.04.2023.
//

import UIKit
import WebKit

class SearchViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate, UIScrollViewDelegate {
	var request: URLRequest?
    var webView: WKWebView!
    var navBar = UIView()
    var bottomBar = UIView()
    let searchTextField = UITextField()
    var pageNameNav = UILabel()
    var pageNameBottom = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: self.view.frame.height), configuration: WKWebViewConfiguration())
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBar)
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.044),
            navBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            navBar.heightAnchor.constraint(equalToConstant: 56),
            
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor),
            webView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            
            bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            bottomBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.13),
        ])

        webView.load(request ?? URLRequest(url: URL(string: UserDefaults.currentServer)!))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
           
        setupTopBar()
        setupBottomBar()
    }
    
    func setupTopBar() {
        
        let background = UIImageView(image: UIImage(named: "background"))
        background.contentMode = .scaleToFill
       
        background.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(background)

        let backButton = UIButton()
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.addTarget(self, action: #selector(previousWebView), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(backButton)

        let reloadButton = UIButton()
        reloadButton.setImage(UIImage(named: "reload"), for: .normal)
        reloadButton.addTarget(self, action: #selector(refreshWebView), for: .touchUpInside)
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(reloadButton)

        pageNameNav.font = UIFont(name: "Onest-Regular", size: 16)
        pageNameNav.translatesAutoresizingMaskIntoConstraints = false
        pageNameNav.textColor = .white
        navBar.addSubview(pageNameNav)

        let nextButton = UIButton()
        nextButton.setImage(UIImage(named: "nextButton"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextWebView), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: navBar.topAnchor),
            background.bottomAnchor.constraint(equalTo: navBar.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: navBar.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: navBar.trailingAnchor),
        
            backButton.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -8),
            backButton.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 16),

            reloadButton.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -8),
            reloadButton.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 12),

            pageNameNav.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -17),
            pageNameNav.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: -8),
            nextButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -16),
        ])
    }
    
    func setupBottomBar() {
        
        let background = UIImageView(image: UIImage(named: "background"))
        background.contentMode = .scaleToFill
        background.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.addSubview(background)
        
        let menuButton = UIButton()
        menuButton.setImage(UIImage(named: "backMenu"), for: .normal)
        menuButton.addTarget(self, action: #selector(backMenu), for: .touchUpInside)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.addSubview(menuButton)
        
        searchTextField.placeholder = "Search"
        searchTextField.layer.cornerRadius = 20
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.white.cgColor
        searchTextField.font = UIFont(name: "Onest-Regular", size: 16)
        searchTextField.textColor = .white
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        searchTextField.leftViewMode = .always
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: attributes)
        searchTextField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.autocorrectionType = .no
        searchTextField.delegate = self
        
        let arrowButton = UIButton()
        arrowButton.setImage(UIImage(named: "arrowForSearch"), for: .normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
       
        bottomBar.addSubview(searchTextField)
        bottomBar.addSubview(arrowButton)
        
        let optionsButton = UIButton()
        optionsButton.setImage(UIImage(named: "menuBrowser"), for: .normal)
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.addSubview(optionsButton)

        pageNameBottom.font = UIFont(name: "Onest-Regular", size: 10)
        pageNameBottom.translatesAutoresizingMaskIntoConstraints = false
        pageNameBottom.textColor = .white
        bottomBar.addSubview(pageNameBottom)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: bottomBar.topAnchor),
            background.widthAnchor.constraint(equalTo: bottomBar.widthAnchor),
            background.heightAnchor.constraint(equalTo: bottomBar.heightAnchor),
            
            menuButton.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 26),
            menuButton.leadingAnchor.constraint(equalTo: bottomBar.leadingAnchor, constant: 16),
            
            searchTextField.widthAnchor.constraint(equalToConstant: 201),
            searchTextField.heightAnchor.constraint(equalToConstant: 38),
            searchTextField.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 26),
            searchTextField.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor, constant: 16),
        
            arrowButton.topAnchor.constraint(equalTo: searchTextField.topAnchor, constant: 7),
            arrowButton.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: -14),
            
            optionsButton.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 26),
            optionsButton.trailingAnchor.constraint(equalTo: bottomBar.trailingAnchor, constant: -16),
            
            pageNameBottom.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 6.5),
            pageNameBottom.centerXAnchor.constraint(equalTo: bottomBar.centerXAnchor)
        ])
   }
    
   @objc func refreshWebView() {
       webView.reload()
   }

    @objc func nextWebView() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

    @objc func previousWebView() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func backMenu() {
		navigationController?.popViewController(animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func arrowButtonTapped() {
        if let text = searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty {
            if let url = URL(string: text), UIApplication.shared.canOpenURL(url) {
                request = URLRequest(url: url)
				webView.load(request ?? URLRequest(url: URL(string: UserDefaults.currentServer)!))
            } else {
                let searchQuery = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
				let searchURLString = "\(UserDefaults.currentServer)\(searchQuery ?? "")"
                if let searchURL = URL(string: searchURLString) {
                    request = URLRequest(url: searchURL)
					webView.load(request ?? URLRequest(url: URL(string: UserDefaults.currentServer)!))
                }
            }
        }
        searchTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        arrowButtonTapped()
        return textField.resignFirstResponder()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let url = webView.url, let host = url.host {
            var displayURL = host.replacingOccurrences(of: "https://", with: "")
            if let range = displayURL.range(of: "?") {
                displayURL = String(displayURL[..<range.lowerBound])
            }
            pageNameNav.text = "\(displayURL)"
            pageNameBottom.text = "\(displayURL)"
        }
    }
}
