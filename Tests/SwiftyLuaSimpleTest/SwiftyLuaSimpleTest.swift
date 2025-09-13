//
//  SwiftyLuaSimpleTest.swift
//
//
//  Created by zhenglicheng on 13/9/2025.
//

import XCTest

@testable import SwiftyLua

final class Lua4SwiftTests: XCTestCase {
    func testExample() throws {

        
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        let lua = LuaVM()
        let result = try lua.execute(string: """
        function fib(m)
            if m < 2 then
              return m
            end
            return fib(m-1) + fib(m-2)
        end
        return fib(15);
        """
        )
        
        if case VirtualMachine.EvalResults.values(let returnValue) = result {
            NSLog("Result of fib(15) = \((returnValue[0] as! Number).toInteger())")
        }
    }
}
