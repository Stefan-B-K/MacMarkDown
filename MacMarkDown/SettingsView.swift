
import SwiftUI

struct SettingsView: View {
  @AppStorage("editorFontSize") var editorFontSize: Int = 14
  
    var body: some View {
      Stepper(value: $editorFontSize, in: 10...30) {
        Text("Font size: \(editorFontSize)" )
          .frame(width: 260, height: 8)
      }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
