import Foundation

class OAuth2TokenStorage {
    var token: String? {
        get {
            userDefaults.string(forKey: "token")
        }
        
        set {
            userDefaults.set(newValue, forKey: "token")
        }
    }

    private let userDefaults = UserDefaults.standard
}
