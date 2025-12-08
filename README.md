# NotiKit

[![Swift Version](https://img.shields.io/badge/Swift-6-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20visionOS%20%7C%20watchOS-lightgrey.svg)](https://developer.apple.com/)
[![Swift Package CI](https://github.com/hexch/NotiKit/actions/workflows/build.yml/badge.svg)](https://github.com/hexch/NotiKit/actions/workflows/build.yml)

NotiKit is a lightweight Swift package designed to simplify the scheduling of local notifications in iOS applications. It provides a clean API for defining notification models and scheduling them with ease, along with built-in support for default promotional notifications.

## Features

- **Simple Scheduling**: Schedule local notifications using a straightforward `async`/`await` API.
- **Custom Models**: Define notifications using the `NotiModel` struct, specifying title, body, trigger date, and type.
- **Localization**: Built-in support for localized notification content.
- **SwiftUI & UIKit Integration**: Helper extensions for both SwiftUI `View` and UIKit `UIApplicationDelegate` to easily schedule default promo notifications.
- **Permission Handling**: Automatically requests notification permissions when scheduling.

## Installation

Add NotiKit to your project using Swift Package Manager.

In Xcode:
1. Go to **File > Add Packages...**
2. Enter the repository URL of NotiKit.
3. Select the version you want to use.

Or add it to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/NotiKit.git", from: "1.0.0")
]
```

## Usage

### Importing NotiKit

```swift
import NotiKit
```

### Scheduling Notifications

Use `NotiService.shared.schedule(_:)` to schedule a list of notifications. This method automatically requests authorization if needed.

```swift
let notification = NotiModel(
    type: .promo,
    title: "Special Offer!",
    body: "Check out our latest deals.",
    triggerDate: Date().addingTimeInterval(3600) // 1 hour from now
)

Task {
    await NotiService.shared.schedule([notification])
}
```

### Using Default Promo Notifications

NotiKit comes with a pre-defined set of promotional notifications (`defaultPromoModels`). You can easily schedule these using the provided extensions.

#### SwiftUI

Use the `prepareDefaultPromoNotifications()` modifier on any View.

```swift
import SwiftUI
import NotiKit

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .prepareDefaultPromoNotifications()
        }
    }
}
```

#### UIKit

Use the `prepareDefaultPromoNotifications()` method in your `AppDelegate`.

```swift
import UIKit
import NotiKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        prepareDefaultPromoNotifications()
        
        return true
    }
}
```

## Requirements

- iOS 15.0+
- Swift 5.5+

## License

This project is licensed under the MIT License.
