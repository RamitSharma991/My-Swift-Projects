//
//  ViewController.swift
//  MultiMark
//
//  Created by Ramit sharma on 08/04/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView: UIView!
    var additionalWindows = [UIWindow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: UIScreen.didConnectNotification, object: nil, queue: nil) { [weak self] notification in
            guard let self = self else { return }
            
            guard let newScreen = notification.object as? UIScreen else { return }
            let screenDimensions = newScreen.bounds
            
            let newWIndow = UIWindow(frame: screenDimensions)
            newWIndow.screen = newScreen
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewViewController") as? PreviewViewController else {
                fatalError("unable to find PreviewViewController!")
            }
            newWIndow.rootViewController = vc
            newWIndow.isHidden = false
            self.additionalWindows.append(newWIndow)
            
            self.textViewDidChange(self.textView as! UITextView)
        }
        NotificationCenter.default.addObserver(forName: UIScreen.didDisconnectNotification, object: nil, queue: nil) { [weak self] notification in
            guard let self = self else { return}
            guard let oldScreen = notification.object as? UIScreen else { return }
            
            if let window = self.additionalWindows.firstIndex(where: {
                $0.screen == oldScreen
            }) {
                self.additionalWindows.remove(at: window)
            }
        }
        // Do any additional setup after loading the view.
    }
    func textViewDidChange(_ textView: UITextView) {
        if let preview = additionalWindows.first?.rootViewController as? PreviewViewController {
        preview.text = textView.text
    }
        if let navController = splitViewController?.viewControllers.last as? UINavigationController {
            if let preview = navController.topViewController as? PreviewViewController {
                preview.text = textView.text
            }
        }
        
    }

}

