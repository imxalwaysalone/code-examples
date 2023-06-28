import Foundation
import WebKit


/// Блокировщик рекламы
enum SFAdBlock {

    // MARK: - Private Properties
    private static var adblockID: String { "adblock" }

    // MARK: - Open Methods

    /// Управление статусом блокировщика рекламы
    public static var isEnabled: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: adblockID)
            newValue ? enableBlocker() : disableBlocker()
        }

        get {
            UserDefaults.standard.bool(forKey: adblockID)
        }
    }

    /// Установить правила блокировки рекламы для конкретного `WKWebView`. В некоторых приложениях этот функционал входит в премиум, поэтому не забудьте cделать проверку `SFPurchaseManager.shared.isUserPremium == true`
    /// - Parameters:
    ///   - webView: WKWebView, для которого устанавливаются правила
    ///   - completion: Замыкание, сообщающее результат, true - правила успешно установились, false - произошла ошибка (вероятная причина: SFAdBlock.isEnabled = false)
    static public func setAdBlockRules(for webView: WKWebView, completion: @escaping (Bool) -> Void) {
        WKContentRuleListStore.default().lookUpContentRuleList(forIdentifier: SFAdBlock.adblockID) { list, error in
            if let error = error {
                print("Failed get adblock list")
                completion(false)
            } else if let list = list {
                print("AdBlock list founded")
                let configuration = webView.configuration
                configuration.userContentController.add(list)
                completion(true)
            }
        }
    }

    // MARK: - Private Methods

    static private func enableBlocker() {
        let fileName = "AdBlockerList"
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print("Cant find file")
            return
        }

        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
              let stringRules = String(data: data, encoding: .utf8) else {
                  print("Cant parse")
                  return
              }

        WKContentRuleListStore.default().compileContentRuleList(forIdentifier: adblockID, encodedContentRuleList: stringRules) { list, error in
            if let error = error {
                print("Failed compile rules for adblock")
            } else if let _ = list {
				print("Rules compiled successfully")
            }
        }
    }

    static private func disableBlocker() {
        WKContentRuleListStore.default().removeContentRuleList(forIdentifier: adblockID) { error in
            if let error = error {
                print("Failed disable adblock")
            } else {
                print("AdBlock Disabled")
            }
        }
    }
}
