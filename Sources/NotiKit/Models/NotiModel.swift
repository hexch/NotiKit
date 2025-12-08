//
//  NotiModel.swift
//  NotiKit
//
//  Created by XIAOCHUAN HE on R 7/12/08.
//

import Foundation

public struct NotiModel: Codable, Identifiable, Sendable {
  public var type: NotiType
  public var title: String
  public var body: String
  public var triggerDate: Date

  public var id: String

  public init(type: NotiType, title: String, body: String, triggerDate: Date) {
    self.type = type
    self.title = title
    self.body = body
    self.triggerDate = triggerDate

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMddHHmmss"
    formatter.locale = Locale(identifier: "en_US_POSIX")

    id = type.rawValue + formatter.string(from: triggerDate)
  }
}
