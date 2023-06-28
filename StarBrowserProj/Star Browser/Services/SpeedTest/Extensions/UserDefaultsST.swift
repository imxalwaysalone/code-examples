import Foundation

extension UserDefaults {
    static var uploadSpeed: Int {
        set { UserDefaults.standard.set(newValue, forKey: "Upload") }
        get { UserDefaults.standard.integer(forKey: "Upload") }
    }
    static var ping: Int {
        set { UserDefaults.standard.set(newValue, forKey: "Ping") }
        get { UserDefaults.standard.integer(forKey: "Ping") }
    }
    static var downloadSpeed: Int {
        set { UserDefaults.standard.set(newValue, forKey: "DownloadSpeed") }
        get { UserDefaults.standard.integer(forKey: "DownloadSpeed") }
    }
	static var isPremium: Bool {
		set { UserDefaults.standard.set(newValue, forKey: "isPremium") }
		get { UserDefaults.standard.bool(forKey: "isPremium") }
	}

	static var currentServer: String {
		set { UserDefaults.standard.set(newValue, forKey: "CurrentServer") }
		get { UserDefaults.standard.string(forKey: "CurrentServer") ?? "" }
	}
}
