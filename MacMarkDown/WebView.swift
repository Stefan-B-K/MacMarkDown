
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
  var html: String
  @AppStorage("styleSheet") var styleSheet: StyleSheet = .raywenderlich
  
  var formattedHtml: String {
    return """
        <html>
          <head>
             <link href="\(styleSheet).css" rel="stylesheet">
          </head>
          <body>
             \(html)
          </body>
        </html>
        """
  }
  
  init(html: String) {
    self.html = html
  }
  
  func makeNSView(context: Context) -> WKWebView {
    WKWebView()
  }
  
  func updateNSView(_ nsView: WKWebView, context: Context) {
    nsView.loadHTMLString(formattedHtml, baseURL: Bundle.main.resourceURL)
  }
}
