//
//  Artist+Enums.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 22/02/2025.
//

import Foundation

public extension QobuzAPI {
  enum artistReleaseType: String, CaseIterable {
    case all
    case album
    case live
    case compilation
    case epSingle
    case other
    case download
  }
  
  enum artistReleaseSortType: String, CaseIterable {
    case relevant
    case releaseDate = "release_date"
  }
  
  enum artistReleaseOrderType: String, CaseIterable {
    case ascending = "asc"
    case descending = "desc"
  }
  
  enum artistReleaseFilterType: String, CaseIterable {
    case hires
    case explicit
  }
}
