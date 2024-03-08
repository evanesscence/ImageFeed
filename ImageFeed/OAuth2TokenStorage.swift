import Foundation

class OAuth2TokenStorage {
    var token: OAuthToken {
        get {
            guard let token = userDefaults.object(forKey: "token") as? OAuthToken else {
                return .init()
            }
            return token
        }
        
        set {
            userDefaults.set(newValue, forKey: "token")
        }
    }
    
    private let userDefaults = UserDefaults.standard
}
