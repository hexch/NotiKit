// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// @NotiService correctly ignores the year component,
/// so the default year from makeDate causes no issues.
public var notiKitImportantDates: [Date] {
  [
    makeDate(month: 1, day: 1, hour: 20),
    makeDate(month: 2, day: 14, hour: 20),
    makeDate(month: 3, day: 3, hour: 20),
    makeDate(month: 4, day: 1, hour: 20),
    makeDate(month: 5, day: 1, hour: 20),
    makeDate(month: 6, day: 1, hour: 20),
    makeDate(month: 7, day: 1, hour: 20),
    makeDate(month: 8, day: 1, hour: 20),
    makeDate(month: 9, day: 1, hour: 20),
    makeDate(month: 10, day: 1, hour: 20),
    makeDate(month: 11, day: 11, hour: 20),
    makeDate(month: 12, day: 12, hour: 20),
    makeDate(month: 12, day: 25, hour: 20),
  ].compactMap(\.self)
}

@available(iOS 15, *)
private let notKitDefaultPromoNotifications: [NotiModel] = notiKitImportantDates.map {
  NotiModel(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: $0
  )
}

public extension View {
  @available(iOS 15.0, *)
  func prepareDefaultPromoNotifications(_ models: [NotiModel] = []) -> some View {
    task {
      let notiModels = notKitDefaultPromoNotifications + models
      if notiModels.isEmpty { return }
      await NotiService.shared.schedule(notiModels)
    }
  }
}

#if canImport(UIKit)
@available(iOS 15.0, *)
public func notiKitPrepareDefaultPromoNotifications(_ models: [NotiModel] = []) {
  let notiModels = notKitDefaultPromoNotifications + models
  if notiModels.isEmpty { return }
  Task {
    await NotiService.shared.schedule(notiModels)
  }
}
#endif // canImport(UIKit)
