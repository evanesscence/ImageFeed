import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    private init() {}
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest {
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
    
    func fetchOAuthToken(_ code: String, completion: @escaping (Result<String, Error>) -> Void) {
        let request = makeOAuthTokenRequest(code: code)
        
        URLSession.shared.data(for: request) { result in
            switch result {
            case .success(let data):
                do {
                    let oauthToken = try JSONDecoder().decode(OAuthToken.self, from: data)
                    guard let accessToken = oauthToken.accessToken else { return }
                    completion(.success(accessToken))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }.resume()
    }
}
