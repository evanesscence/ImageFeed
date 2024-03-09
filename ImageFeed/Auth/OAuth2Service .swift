import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    private init() {}
    
    func makeOAuthTokenRequest(code: String) -> URLRequest {
        guard var urlComponents = URLComponents(string: "https://unsplash.com/oauth/token") else { preconditionFailure("Error") }
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Constants.accessKey),
            URLQueryItem(name: "client_secret", value: Constants.secretKey),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "grant_type", value: "authorization_code")
        ]
        
        guard let url = urlComponents.url else { preconditionFailure("Error") }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
    
    func fetchOAuthToken(_ code: String) {
        let request = makeOAuthTokenRequest(code: code)
        
        URLSession.shared.data(for: request) { [weak self] result in
            guard let self = self else { return }
    
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(OAuthToken.self, from: data)
                    OAuth2TokenStorage().token = json.access_token
                    
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print(error)
            }
            
        }.resume()
        
    }
}
