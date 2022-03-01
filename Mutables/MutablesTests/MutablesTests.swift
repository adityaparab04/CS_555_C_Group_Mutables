//
//  MutablesTests.swift
//  MutablesTests
//
//  Created by Rahul Pawar on 3/1/22.
//

import XCTest
@testable import Mutables

class MutablesTests: XCTestCase {

    var sut : Validation?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Validation()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
    }
    
    func test_validEmail()  {
        let ans = sut?.emailValidationa(email: "foobar@gmail.com")
        XCTAssertEqual(ans, true)
    }
    func test_invalidEmail(){
        let ans = sut?.emailValidationa(email: "123@123")
        XCTAssertEqual(ans, false)
    }
    func test_emptyEmail(){
        let ans = sut?.emailValidationa(email: "")
        XCTAssertEqual(ans, false)
    }
    
    func test_emptyPassword(){
        let ans = sut?.passwordValidation(password: "")
        XCTAssertEqual(ans, false)
    }
    func test_validPassword(){
        let ans = sut?.passwordValidation(password: "Foobar123")
        XCTAssertEqual(ans, true)
    }
    func test_shortPassword(){
        let ans = sut?.passwordValidation(password: "Foo123")
        XCTAssertEqual(ans, false)
    }

    

}
