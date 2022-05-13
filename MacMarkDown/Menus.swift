
import SwiftUI
import WebKit

struct Menus: Commands {
  @AppStorage("styleSheet") var styleSheet: StyleSheet = .raywenderlich
  
  var body: some Commands {
    
    
    CommandGroup(before: .help) {
      Button("Markdown Cheatsheet") { showCheatSheet() }
        .keyboardShortcut("/", modifiers: .command)
      Divider()
    }
    
    CommandMenu("Stylesheet") {
      ForEach(StyleSheet.allCases, id: \.self) { style in
        Button(style.rawValue) {
          styleSheet = style
        }
        .keyboardShortcut(style.shortcutKey, modifiers: .command)
      }
    }
  }
  
  func showCheatSheet() {
    let cheetSheet = "https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet"
    guard let url = URL(string: cheetSheet) else { fatalError("Invalid cheetsheet URL")}
    NSWorkspace.shared.open(url)
  }
  
}
