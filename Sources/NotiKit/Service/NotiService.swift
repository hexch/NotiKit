//
//  NotiService.swift
//  NotiKit
//
//  Created by XIAOCHUAN HE on R 7/12/08.
//

import Foundation
import LoggerKit
import UserNotifications

@MainActor
public class NotiService: NSObject {
  public static let shared = NotiService()

  private nonisolated let logger: Logger = .default(category: "NotiService")

  override init() {
    super.init()
    UNUserNotificationCenter.current().delegate = self
  }

  public func schedule(_ models: [NotiModel]) async {
    do {
      let granted = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
      logger.debug("requestAuthorization: \(granted)")
      guard granted else { return }
    } catch {
      logger.error("requestAuthorization: \(error.localizedDescription)")
      return
    }

    let calendar = Calendar.current
    logger.debug("models count: \(models.count)")
    for model in models {
      // 构造内容
      let content = UNMutableNotificationContent()
      content.title = model.title
      content.body = model.body
      content.sound = .default

      // 只提取月、日、时、分，忽略年份
      let components = calendar.dateComponents([.month, .day, .hour, .minute], from: model.triggerDate)
      // 系统会自动计算下一个符合该组件的时间点
      let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
      let request = UNNotificationRequest(identifier: model.id, content: content, trigger: trigger)

      do {
        try await UNUserNotificationCenter.current().add(request)
        logger.debug("Scheduled '\(model.title)' with components: \(components)")
      } catch {
        logger.error("error: \(error.localizedDescription)")
      }
    }
  }

  public func cancelAll(_ type: NotiType) async {
    let notificationCenter = UNUserNotificationCenter.current()
    let requests = await notificationCenter.pendingNotificationRequests()
    let ids = requests.filter { $0.identifier.hasPrefix(type.rawValue) }
      .map(\.identifier)
    notificationCenter.removePendingNotificationRequests(withIdentifiers: ids)
  }

  public func pendingNotificationRequests() async -> [UNNotificationRequest] {
    await UNUserNotificationCenter.current().pendingNotificationRequests()
  }
}

extension NotiService: UNUserNotificationCenterDelegate {
  public nonisolated func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    completionHandler()
    logger.debug("didReceive response: \(response)")
  }

  public nonisolated func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (
      UNNotificationPresentationOptions
    ) -> Void
  ) {
    completionHandler([.banner, .sound])
    logger.debug("willPresent notification: \(notification)")
  }
}
