//
//  iXuTests.swift
//  iXuTests
//
//  Created by Ramit sharma on 12/02/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//


import XCTest
@testable import iXu

class iXuTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testQuestionOperandsWithinBounds() {
        let question = Question()
        
        XCTAssertGreaterThanOrEqual(question.left, 1)
        XCTAssertGreaterThanOrEqual(question.right, 1)
        XCTAssertLessThanOrEqual(question.left, 12)
        XCTAssertLessThanOrEqual(question.right, 12)

    }
    
    func testQuestionStringIsFormattedCorrectly() {
        let question = Question(left: 5, right: 5, operation: .multiply)
        XCTAssertEqual(question.string, "What is 5 times 5?")
    }
    func testFivePlusFive() {
        let question = Question(left: 5, right: 5, operation: .addition)
        XCTAssertEqual(question.answer, 10)
    }

    func testStringInputWorks() {
        let question = Question(left: 5, right: 5, operation: .addition)
        let game = iMultiply()
        let result = game.process("10", for: question)
        XCTAssertEqual(result, "Wrong!")
    }
    
    func testAnsweringQuestionIncrementsCounter() {
        let question = Question(left: 5, right: 5, operation: .addition)
        let game = iMultiply()
        _ = game.process("10", for: question)
        XCTAssertEqual(game.questionNumber, 2)
    }
    
    func testGameCompletesAt11thQuestion() {
        let game = iMultiply()
        game.answerFunction = { return "556" }
        game.start()
        XCTAssertEqual(game.questionNumber, 11)
        XCTAssertEqual(game.score, 0)
    }
    
    
}
