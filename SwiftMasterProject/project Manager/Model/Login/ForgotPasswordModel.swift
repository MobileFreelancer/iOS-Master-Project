//
//  ForgotPasswordModel.swift
//  SwiftMasterProject
//
//  Created by Apple on 29/12/23.
//

import Foundation

// MARK: - ForgotPasswordModel
class ForgotPasswordModel: Codable {
    let status, message: String?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
    }

    init(status: String?, message: String?) {
        self.status = status
        self.message = message
    }
}
