//
//  ViewController.swift
//  FunWithFlags
//
//  Created by Ramit sharma on 12/03/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        
        btn1.layer.borderColor = UIColor.lightGray.cgColor
        btn2.layer.borderColor = UIColor.lightGray.cgColor
        btn3.layer.borderColor = UIColor(red: 1.0, green: 0.3, blue: 0.9, alpha: 0.9).cgColor

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .done, target: self, action: #selector(showScore))
        
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct Answer!"
            score += 1
        } else{
            title = "Wrong!"
        score -= 1
        
            
        
        }
    let ac = UIAlertController(title: title, message: "Press continue for the next flag", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        if score == 10 {
            
           ac.addAction(UIAlertAction(title: "Replay", style: .destructive, handler: askQuestion))
        }
        
    }
    
    @objc func showScore() {
        var sCore: String
        sCore = "\(score)"
        
        let sc = UIAlertController(title: sCore, message: "Final Score", preferredStyle: .alert)
        sc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(sc, animated: true)
        sc.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
   

    }
    

}
