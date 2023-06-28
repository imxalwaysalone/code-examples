import Foundation

extension String {
    func  localized() -> String {
        NSLocalizedString(self, tableName: "localizable", bundle: .main, value: self, comment: self)
    }
   
}
