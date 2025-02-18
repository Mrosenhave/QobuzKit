extension APIEndpoint {
    func constructURL() -> URL? {
        var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        
        if method == .get, let parameters = parameters as? [String: String] {
            components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        return components?.url
    }
}