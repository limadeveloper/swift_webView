//
//  ViewController.swift
//  WebView
//
//  Created by John Silva on 5/20/15.
//  Copyright (c) 2015 John Silva. All rights reserved.
//

import UIKit
let url = "http://limadeveloper.com"

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        
        let requestUrl = NSURL(string: url)
        let request = NSURLRequest(URL: requestUrl!)
        self.webView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:
    // MARK: web view delegate
    func webViewDidStartLoad(webView: UIWebView) {
        println("Carregando")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        println("Carregamento finalizado")
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        println("Ocorreu um erro ao carregar a página")
        simpleAlert("Ocorreu um erro ao carregar a página, tente novamente.", message: nil, button: "Ok")
    }
    
    // MARK: IBActions
    @IBAction func goForward(sender: UIBarButtonItem) {
        self.forward()
    }
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        self.back()
    }
    
    @IBAction func reload(sender: UIBarButtonItem) {
        self.reload()
    }
    
    // MARK:
    // MARK: methods
    func simpleAlert(title:String?, message:String?, button:String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: button!, style: UIAlertActionStyle.Default) { (var action: UIAlertAction!) -> Void in
            self.reload()
        }
        alertController.addAction(defaultAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func forward() {
        self.webView.goForward()
    }
    
    func back() {
        self.webView.goBack()
    }
    
    func reload() {
        self.webView.reload()
    }

}

