//
//  SkiCompanionTests.swift
//  SkiCompanionTests
//
//  Created by Freddie Nunn on 16/09/2021.
//

import XCTest
@testable import SkiCompanion

class SkiCompanionTests: XCTestCase {
    func testLogInRetrievesData() {
        let exp = expectation(description: "accessing user data")
        let state = StateController(currentResort: "", currentUser: User(email: "", password: "", currentResort: "", achievements: []))
        state.fetchUser(ID: "im3x88eUaWSIq9LCiERlhZisLBR2")
        let testUser = User(email: "admin@admin.com", password: "password", currentResort: "Verbier", achievements: [Achievement(name: "Novice Speed", type: "mph", goal: 30)])
        XCTAssertEqual(state.currentUser, testUser)
    }

}
