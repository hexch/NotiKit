//
//  DefaultPromoModels.swift
//  NotiKit
//
//  Created by XIAOCHUAN HE on R 7/12/08.
//

import Foundation

private extension Date {
  init(_ year: Int? = nil, month: Int, day: Int) {
    var comp = DateComponents()
    comp.year = year
    comp.month = month
    comp.day = day
    self.init(timeInterval: 0, since: Calendar.current.date(from: comp)!)
  }
}

@available(iOS 15, *)
let defaultPromoModels: [NotiModel] = [
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 1, day: 1) // New year
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 2, day: 14) // Valentine's Day
  ),

  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 3, day: 3)
  ),

  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 4, day: 1)
  ),

  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 5, day: 1)
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 6, day: 1)
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 7, day: 1)
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 8, day: 1)
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 9, day: 1)
  ),

  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 10, day: 1)
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 11, day: 11)
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 12, day: 12)
  ),
  .init(
    type: .promo,
    title: String(localized: "default_promo_title", bundle: .module),
    body: String(localized: "default_promo_body", bundle: .module),
    triggerDate: Date(month: 12, day: 25) // Chrismas
  ),
]
