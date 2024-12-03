//
//  BasicResponse.swift
//  SportsLifeSuccess
//
//  Created by Potenza on 22/08/23.
//

import Foundation

// MARK: - BasicResponse
class BasicResponse: Codable {
    var status, message: String?, club_id: Int?, team_id: Int?, game_id:Int?, clientSecret: String?,package_status : Bool?

    init(status: String?, message: String?, club_id: Int = 0, team_id: Int = 0, game_id: Int = 0, clientSecret: String = "", package_status: Bool = false) {
        self.status = status
        self.message = message
        self.club_id = club_id
        self.team_id = team_id
        self.game_id = game_id
        self.clientSecret = clientSecret
        self.package_status = package_status
    }
}
