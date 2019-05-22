//
//  DetailViewController.swift
//  WhiteHousePetitions
//
//  Created by Ramit sharma on 09/04/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webview: WKWebView!
    var detailItem: Petition?

    override func loadView() {
        webview = WKWebView()
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
        <head>
        <meta name="viewsport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        </body>
        \(detailItem.body)
        </body>
        </html>
        """
        webview.loadHTMLString(html, baseURL: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
