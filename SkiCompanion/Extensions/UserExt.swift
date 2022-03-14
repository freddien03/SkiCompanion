//
//  UserExt.swift
//  SkiCompanion
//
//  Created by Nunn, Frederick (IRG) on 03/12/2021.
//

import Foundation

extension User: Equatable {
//    allow users to be compared
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.currrentResort == rhs.currrentResort || lhs.email == rhs.email || lhs.achievements == rhs.achievements || lhs.password == rhs.password
    }
}
