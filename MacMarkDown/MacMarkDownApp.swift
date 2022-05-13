
import SwiftUI

@main
struct MacMarkDownApp: App {
  var body: some Scene {
    DocumentGroup(newDocument: MacMarkDownDocument()) { file in
      ContentView(document: file.$document)
    }
    .commands {
      Menus()
    }
    Settings {
      SettingsView()
    }
  }
}
