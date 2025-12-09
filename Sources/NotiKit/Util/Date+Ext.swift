//
//  Date+Ext.swift
//  NotiKit
//
//  Created by XIAOCHUAN HE on R 7/12/09.
//

import Foundation

func makeDate(
  year: Int? = nil,
  month: Int,
  day: Int,
  hour: Int = 0,
  minute: Int = 0
) -> Date? {
  var comp = DateComponents()
  if let year {
    comp.year = year
  }
  comp.month = month
  comp.day = day
  comp.hour = hour
  comp.minute = minute
  return Calendar.current.date(from: comp)
}
