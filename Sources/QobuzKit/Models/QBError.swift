//
//  QBError.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 21/02/2025.
//

import Foundation

public struct QBError: Codable, Error {
  public let status: String?
  public let code: Int
  public let message: String
}
