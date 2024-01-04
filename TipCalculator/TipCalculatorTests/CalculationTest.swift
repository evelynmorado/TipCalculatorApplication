//
//  CalculationTest.swift
//  TipCalculatorTests
//
//  Created by Evelyn Morado on 1/3/24.
//

import XCTest
@testable import TipCalculator

final class CalculationTest: XCTestCase {

    func testSuccessfulTipCalculation() {
        let enteredAmount = 100.00
        let tipSlider = 20.0
        let calculation = Calculation()
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        XCTAssertEqual(tip, 20)
    }    
    
    func testNegativeTipCalculation() {
        let enteredAmount = -100.00
        let tipSlider = 20.0
        let calculation = Calculation()
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        XCTAssertNil(tip)
    }  
    
    func testZeroTipCalculation() {
        let enteredAmount = 0.00
        let tipSlider = 20.0
        let calculation = Calculation()
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        XCTAssertEqual(tip, 0)
    }
    
    func testLargerValuesTipCalculation() {
        let enteredAmount = 1000.00
        let tipSlider = 34.0
        let calculation = Calculation()
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        XCTAssertEqual(tip, 340)
    }

}
