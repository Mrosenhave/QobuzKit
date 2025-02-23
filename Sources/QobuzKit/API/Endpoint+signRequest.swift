//
//  Endpoint+signRequest.swift
//  QobuzKit
//
//  Created by Markus Rosenhave on 23/02/2025.
//

import Foundation
import CommonCrypto

extension Endpoint {
  public func signRequest(appSecret: String) -> [URLQueryItem] {
    let timestamp = Int(Date().timeIntervalSince1970)
    var tempString = ""
    tempString.append(path.replacingOccurrences(of: "/", with: ""))
    for parameter in parameters.sorted(by: { $0.name < $1.name }) {
      if let value = parameter.value {
        tempString.append(parameter.name)
        tempString.append(value)
      }
    }
    tempString.append(String(timestamp))
    tempString.append(appSecret)
    return [
      .init(name: QobuzAPI.Parameters.requestTs(), value: String(timestamp)),
      .init(name: QobuzAPI.Parameters.requestSig(), value: calculateMD5Hash(for: tempString))
    ]
  }
  
  private func calculateMD5Hash(for string: String) -> String {
    guard let messageData = string.data(using: .utf8) else {
        return ""
    }
    
    var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
    
    _ = digestData.withUnsafeMutableBytes { digestBytes in
        messageData.withUnsafeBytes { messageBytes in
            CC_MD5(messageBytes.baseAddress, CC_LONG(messageData.count), digestBytes.bindMemory(to: UInt8.self).baseAddress)
        }
    }
    
    let md5Hex = digestData.map { String(format: "%02hhx", $0) }.joined()
    return md5Hex
}
}
