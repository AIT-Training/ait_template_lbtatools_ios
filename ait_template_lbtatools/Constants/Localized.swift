// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  /// Update bundle if you need to change app language
  static var bundle: Bundle?

  /// Selamat datang project Template.
  static var welcomeMessage: String {
    return L10n.tr("Localizable", "welcome_message")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let language = MultiLanguage.getLanguage().rawValue
    let searchBundle = Bundle(path: Bundle.main.path(forResource: language, ofType: "lproj")!)!
    let format = NSLocalizedString(key, tableName: table, bundle: searchBundle, comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
