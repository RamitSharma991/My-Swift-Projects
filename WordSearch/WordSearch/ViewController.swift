//
//  ViewController.swift
//  WordSearch
//
//  Created by Ramit sharma on 18/02/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.url(forResource: "capitals", withExtension: ".json")!
        let contents = try! Data(contentsOf: path)
        let words = try! JSONDecoder().decode([Word].self, from: contents)
        
        let wordSearch = WordSearch()
        wordSearch.words = words
        wordSearch.makeGrid()
        
        let output = wordSearch.render()
        let url = getDocumentsDirectory().appendingPathComponent("output.pdf")
        try? output.write(to: url)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}



