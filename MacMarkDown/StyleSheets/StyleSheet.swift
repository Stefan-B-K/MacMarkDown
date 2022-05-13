
import SwiftUI

enum StyleSheet: String, CaseIterable {
  case raywenderlich = "Ray Wenderlich"
  case github = "GitHub"
  case lopash = "Lopash"
  case solarizeddark = "Solarized Dark"
  case ulysses = "Ulysses"

  var shortcutKey: KeyEquivalent {
    switch self {
    case .raywenderlich: return "1"
    case .github: return "2"
    case .lopash: return "3"
    case .solarizeddark: return "4"
    case .ulysses: return "5"
    }
  }
}
