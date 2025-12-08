//
//  Logger+Default.swift
//  PayWall
//
//  Created by XIAOCHUAN HE on R 7/08/01.
//

import Foundation
import LoggerKit

extension LoggerProtocol where Self == Logger {
  static func `default`(subsystem: String = "nwr-studio.NotiKit", category: String) -> Self {
    let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?
      .appendingPathComponent("app.log")
    return Logger(core: FileOSLoggerCore(subsystem: subsystem, category: category, fileUrl: fileUrl))
  }
}
