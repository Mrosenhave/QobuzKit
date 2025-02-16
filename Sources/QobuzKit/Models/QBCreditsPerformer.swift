//
//  QBCreditsPerformer.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

struct QBCreditsPerformer: Codable, Equatable {
    let name: String
    let roles: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case roles = "role"
    }
}

func parsePerformers(from inputString: String) -> [QBCreditsPerformer]? {
    let performerStrings = inputString.split(separator: " - ").map { String($0) }
    var performers: [QBCreditsPerformer] = []

    for performerString in performerStrings {
        let components = performerString.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespaces) }
        if let name = components.first, components.count > 1 {
            let roles = Array(components.dropFirst())
            let performer = QBCreditsPerformer(name: name, roles: roles)
            performers.append(performer)
        } else {
            // If parsing fails at any point, return nil
            return nil
        }
    }

    return performers
}

func formatPerformers(_ performers: [QBCreditsPerformer]?) -> String? {
    guard let performers = performers else {
        return nil
    }

    var formattedString = ""

    for performer in performers {
        let rolesString = performer.roles.joined(separator: ", ")
        let performerString = "\(performer.name) - \(rolesString)"
        formattedString.append(performerString)

        if performer != performers.last {
            formattedString.append(" - ")
        }
    }

    return formattedString
}
