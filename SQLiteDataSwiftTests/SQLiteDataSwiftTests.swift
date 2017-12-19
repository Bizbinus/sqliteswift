//
//  SQLiteDataSwiftTests.swift
//  SQLiteDataSwiftTests
//
//  Created by Gail Sparks on 12/17/17.
//  Copyright © 2017 Bizbin LLC. All rights reserved.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.


import XCTest
@testable import SQLiteDataSwift

class SQLiteDataSwiftTests: XCTestCase {
	
	var database: SQLiteConnector!
	
	
    override func setUp() {
        super.setUp()
			database = SQLiteConnector(databaseName: "testdata")
			
			
			
	}
    
    override func tearDown() {
        super.tearDown()
    }
	
	
	func testDB_whenOpenIsOpen() {
		
		do {
			
			try database.open()
			
			XCTAssertTrue(database.isOpen())
			
			database.close()
			
		}
		catch {
			
			
		}
		
	}
	
	func testDB_whenOpenCantReopen() {
		
		
		XCTAssertNoThrow(try database.open())
		XCTAssertThrowsError(try database.open())
		
		database.close()
		
		
	}
	
	//This function creates it's own database to test a create error
	func testDB_whenCreatingDatabaseFailsThrowsError() {
		
		//create a new database here with an illegal file name
		
		let db = SQLiteConnector(databaseName: "")
		
		XCTAssertThrowsError(try db.open())
		
		db.close()
		
	}
	
	func testDB_whenDatabaseClosedNotIsOpen()
	{
		
			try! database.open()
		
			database.close()
		
		XCTAssertTrue(!database.isOpen())
		
		
	}
    
    func testPerformanceExample() {
			
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
