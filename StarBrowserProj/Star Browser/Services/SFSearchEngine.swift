import Foundation

/// Сервис отвечающий ща поисковую машину браузера
class SFSearchEngine {
	enum EngineType {
		case google
		case duckgogo
		case bing
	}
	static let shared = SFSearchEngine()

	var state: EngineType = .google

    var title: String {
        switch state {
            case .google:
                return "Google"
            case .duckgogo:
                return "DuckDuckGo"
            case .bing:
                return "Bing"
        }
    }

    /// URL адрес
    var searchDomain: String {
        switch state {
            case .google:
                return "https://www.google.ru/search?q="
            case .duckgogo:
                return "https://duckduckgo.com/?q="
            case .bing:
                return "https://www.bing.com/search?q="
        }
    }
}
