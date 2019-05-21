//
//  ViewController.swift
//  DeclarativeUI
//
//  Created by Ramit sharma on 04/03/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let navigationManager = NavigationManager()
        
        navigationManager.fetch { initialScreen in
            let vc = TableScreenVC(screen: initialScreen)
            vc.navigationManager = navigationManager
            navigationController?.viewControllers = [vc]
        }
    }
}
