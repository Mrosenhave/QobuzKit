//
//  Client+getSecrets.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 18/02/2025.
//

import Foundation
import RegexBuilder

extension QobuzClient {
  public func getSecrets(_ bundle: String) -> [String]? {
      let seed = Reference(Substring.self)
      let timezone = Reference(Substring.self)
      let seedTimezoneRegex = Regex {
        ("a"..."z")
        ".initialSeed(\""
        Capture(as: seed) {
          OneOrMore {
            CharacterClass(
              .anyOf("="),
              .word
            )
          }
        }
        "\",window.utimezone."
        Capture(as: timezone) {
          OneOrMore(("a"..."z"))
        }
        ")"
      }
      .anchorsMatchLineEndings()
      
      // Find seed and timezone matches
      let seedMatches = bundle.matches(of: seedTimezoneRegex)
      
      
      var timezones: [String] = [String]()
      var seeds: [[String]] = [[String]]()
      for match in seedMatches {
          timezones.append(String(match[timezone]))
          seeds.append([String(match[seed])])
      }
      
      // get extra info required to calculate secret
      
      let timezonesString =  timezones.map {$0.capitalized}.joined(separator: "|")
      let infoExtrasRegexString = "name:\"\\w+/(?<timezone>\(timezonesString))\",info:\"(?<info>[\\w=]+)\",extras:\"(?<extras>[\\w=]+)\""
    guard let infoExtrasRegex = try? NSRegularExpression(pattern: infoExtrasRegexString, options: []) else {
      print("getSecrets ERROR: infoExtrasRegex is nil")
      return nil
    }
      let infoExtrasMatches = infoExtrasRegex.matches(in: bundle, options: [], range: NSRange(location: 0, length: bundle.count))
      for match in infoExtrasMatches {
          if let timezoneRange = Range(match.range(withName: "timezone"), in: bundle),
             let infoRange = Range(match.range(withName: "info"), in: bundle),
             let extrasRange = Range(match.range(withName: "extras"), in: bundle) {
              let timezone = String(bundle[timezoneRange]).lowercased()
              let info = String(bundle[infoRange])
              let extras = String(bundle[extrasRange])
              let index = timezones.firstIndex(of: timezone.lowercased())
              if let index {
                  seeds[index].append(contentsOf: [info, extras])
              }
          }
      }
      
      //remove timezones that couldn't be decoded
      for seed in seeds {
          if seed.count < 3, let index = seeds.firstIndex(of: seed){
              seeds.remove(at: index)
              timezones.remove(at: index)
          }
      }
      // swap the order so that the secret most likely to work is listed first
      if timezones.count > 1, seeds.count > 1 {
          timezones.swapAt(0, 1)
          seeds.swapAt(0, 1)
      }
      
      var decodedSecrets = [String]()
      for index in timezones.indices {
              let seed = seeds[index]
              let seedString = seed.joined()
          guard let decodedData = Data(base64Encoded: seedString, options: .ignoreUnknownCharacters) else {
            print("getSecrets ERROR: Failed to decode seedString")
            return nil
          }
          let decodedString = String(data: decodedData, encoding: .utf8)?.dropLast(33) ?? ""
          if !decodedString.isEmpty {
              decodedSecrets.append(String(decodedString))
          }
      }
      guard !decodedSecrets.isEmpty else {
        print("getSecrets ERROR: no secrets were found")
        return nil
      }
      return decodedSecrets

  }
}
