//
//  ArithmeticTestTests.swift
//  ArithmeticTestTests
//
//  Created by Yuni on 2019/3/5.
//  Copyright © 2019 Yuni. All rights reserved.
//

import XCTest
@testable import ArithmeticTest

class ArithmeticTestTests: XCTestCase {
    
    var vc: MainVC = MainVC()
    var nums: CalculateNums?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        vc.loadView()
        
        nums = CalculateNums.init(addBase: 1, addNum: 2,
                                  subBase: 4, subNum: 3,
                                  mulBase: 5, mulNum: 6,
                                  divBase: 10, divNum: 2,
                                  powBase: 7, powNum: 2)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testArithmetic() {
        let add = vc.addition(num: (nums?.addBase)!, addNum: (nums?.addNum)!)
        XCTAssert(add == 3)
        
        let sub = vc.subtraction(num: (nums?.subBase)!, subNum: (nums?.subNum)!)
        XCTAssert(sub == 1)
        
        let mul = vc.multiplication(num: (nums?.mulBase)!, mulNum: (nums?.mulNum)!)
        XCTAssert(mul == 30)
        
        let div = vc.division(num: (nums?.divBase)!, divNum: (nums?.divNum)!)
        XCTAssert(div == 5)
        
        let pow = vc.power(base: (nums?.powBase)!, exponent: (nums?.powNum)!)
        XCTAssert(pow == 49)
    }

    func testLabelValues() {
        vc.updateLabels(nums: nums!)

        XCTAssert(vc.addLabel.text == "1 + 2 = 3", "Error: addLabel doesn't show the right text.")
        XCTAssert(vc.subLabel.text == "4 - 3 = 1", "Error: subLabel doesn't show the right text.")
        XCTAssert(vc.mulLabel.text == "5 * 6 = 30", "Error: mulLabel doesn't show the right text.")
        XCTAssert(vc.divLabel.text == "10 / 2 = 5", "Error: divLabel doesn't show the right text.")
        XCTAssert(vc.powLabel.text == "7 ^ 2 = 49", "Error: powLabel doesn't show the right text.")
    }
}
