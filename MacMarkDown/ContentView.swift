
import SwiftUI

struct ContentView: View {
  @Binding var document: MacMarkDownDocument
  @AppStorage("editorFontSize") var editorFontSize: Int = 14
  @State private var previewStyle: PreviewStyle = .web
  
  var attributedString: AttributedString {
    let markdownOptions = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnly)
    let attribString = try? AttributedString(
      markdown: document.text,
      options: markdownOptions)
    return attribString ??
    AttributedString("There was an error parsing the Markdown.")
  }
  
  var body: some View {
    HSplitView {
      TextEditor(text: $document.text)
        .frame(minWidth: 200)
        .font(.system(size: CGFloat(editorFontSize)))
      if previewStyle == .web {
        WebView(html: document.html)
          .frame(minWidth: 200)
      }
      if previewStyle == .html {
        ScrollView {
          Text(document.html)
            .frame(minWidth: 200)
            .frame(maxWidth: .infinity, maxHeight: .infinity,
                   alignment: .topLeading)
            .padding()
            .font(.system(size: CGFloat(editorFontSize)))
            .textSelection(.enabled)
        }
      }
      if previewStyle == .attrString {
        ScrollView {
          Text(attributedString)
            .frame(minWidth: 200)
            .frame(maxWidth: .infinity, maxHeight: .infinity,
                   alignment: .topLeading)
            .padding()
            .font(.system(size: CGFloat(editorFontSize)))
            .textSelection(.enabled)
        }
      }
      
    }
    .toolbar {
      Toolbars(previewStyle: $previewStyle)
    }
    .frame(minWidth: 600, idealWidth: 900, maxWidth: .infinity,
           minHeight: 400, idealHeight: 600, maxHeight: .infinity)
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(document: .constant(MacMarkDownDocument()))
  }
}
