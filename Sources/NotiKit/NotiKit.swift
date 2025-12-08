// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public extension View {
  @available(iOS 15.0, *)
  func prepareDefaultPromoNotifications() -> some View {
    task {
      await NotiService.shared.schedule(defaultPromoModels)
    }
  }
}

public extension UIApplicationDelegate {
  @available(iOS 15.0, *)
  func prepareDefaultPromoNotifications() {
    Task {
      await NotiService.shared.schedule(defaultPromoModels)
    }
  }
}
