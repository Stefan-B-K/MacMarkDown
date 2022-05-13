
import SwiftUI

enum PreviewStyle {
  case web, html, attrString, hidden
}

struct Toolbars: ToolbarContent {
  @Binding var previewStyle: PreviewStyle
  
  var body: some ToolbarContent {
    ToolbarItem {
      Picker("", selection: $previewStyle) {
        Image(systemName: "doc.richtext")
          .tag(PreviewStyle.web)
        Image(systemName: "doc.plaintext")
          .tag(PreviewStyle.html)
        Image(systemName: "at")
          .tag(PreviewStyle.attrString)
        Image(systemName: "eye.slash")
          .tag(PreviewStyle.hidden)
      }
      .pickerStyle(SegmentedPickerStyle())
      .help("Web preview, raw HTML preview, Attributed-Strings preview or Hide preview")
    }
  }
  
}
