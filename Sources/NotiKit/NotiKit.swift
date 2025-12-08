// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public extension View {
  @available(iOS 15.0, *)
  func prepareDefaultPromoNotifications(_ models: [NotiModel] = []) -> some View {
    task {
      await NotiService.shared.schedule(defaultPromoModels + models)
    }
  }
}

#if canImport(UIKit)
  public extension UIApplicationDelegate {
    @available(iOS 15.0, *)
    func prepareDefaultPromoNotifications(_ models: [NotiModel] = []) {
      Task {
        await NotiService.shared.schedule(defaultPromoModels + models)
      }
    }
  }
#endif // canImport(UIKit)
