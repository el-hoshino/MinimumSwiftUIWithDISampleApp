//
//  ProfileUsecaseTests.swift
//  iOS
//
//  Created by 史 翔新 on 2020/07/03.
//

import XCTest
@testable import MyProfile

class UnitTests: XCTestCase {
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let date20000701 = Date.at(year: 2000, month: 7, day: 1)
        let date20200630 = Date.at(year: 2020, month: 6, day: 30)
        let date20200701 = Date.at(year: 2020, month: 7, day: 1)
        
        let usecase = ProfileUsecase()
        XCTAssertNil(usecase.ageOnYear(at: date20000701))
        
        usecase.publishedBirthday = date20000701
        XCTAssertEqual(usecase.ageOnYear(at: date20000701), 0)
        XCTAssertEqual(usecase.ageOnYear(at: date20200630), 19)
        XCTAssertEqual(usecase.ageOnYear(at: date20200701), 20)
    }
    
}

private extension Date {
    
    static func at(year: Int, month: Int, day: Int) -> Date {
        
        let components = DateComponents(calendar: .init(identifier: .gregorian),
                                        year: year,
                                        month: month,
                                        day: day)
        
        return components.date!
        
    }
    
}
