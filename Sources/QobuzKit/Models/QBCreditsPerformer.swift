//
//  QBCreditsPerformer.swift
//  SwiftBuz
//
//  Created by Markus Rosenhave on 30/01/2024.
//

import Foundation

public struct QBCreditsPerformer: Codable, Equatable {
    public let name: String
    public let roles: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case roles = "role"
    }
}

func parsePerformers(from inputString: String) -> [String: [String]]? {
    let performerStrings = inputString.split(separator: " - ").map { String($0) }
    var performerDict: [String: Set<String>] = [:] // Using Set to prevent duplicate roles

    for performerString in performerStrings {
      let components = performerString.split(separator: ",").map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
        if let name = components.first, components.count > 1 {
            let roles = Set(components.dropFirst()) // Convert roles to a Set to ensure uniqueness
            performerDict[name, default: []].formUnion(roles)
        } else {
            return nil // Return nil if parsing fails
        }
    }

    // Convert Set<String> to [String] and sort roles for consistency
//  print(performerDict)
    return performerDict.mapValues { Array($0).sorted() }
}


func formatPerformers(_ performers: [String: Set<String>]?) -> String? {
    guard let performers else {
        return nil
    }

    var formattedString = ""

    for performer in performers {
      if formattedString != "" {
        //All but first performer has " - "
         formattedString.append(" - ")
      }
      let rolesString = performer.value.joined(separator: ", ")
        let performerString = "\(performer.key) - \(rolesString)"
        formattedString.append(performerString)

    }

    return formattedString
}

