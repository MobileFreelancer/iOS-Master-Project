//
//  LoginModel.swift
//  SwiftMasterProject
//
//  Created by Apple on 28/12/23.
//

import Foundation

// MARK: - LoginModel
class LoginModel: Codable {
    let id: Int?
    let username, email, firstName, lastName: String?
    let gender: String?
    let image: String?
    let token: String?

    init(id: Int?, username: String?, email: String?, firstName: String?, lastName: String?, gender: String?, image: String?, token: String?) {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.image = image
        self.token = token
    }
}
