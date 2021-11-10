import Foundation
import Alamofire

struct MarvelEndpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    
    static func characters() -> Self {
        let ts = Date().timeIntervalSince1970.description
        let publicKey = Bundle.main.infoDictionary?["MARVEL_PUBLIC_KEY"] as? String
        let privateKey = Bundle.main.infoDictionary?["MARVEL_PRIVATE_KEY"] as? String
        let hash = Crypto.md5(string: "\(ts)\(privateKey!)\(publicKey!)")
        return MarvelEndpoint(
            path: "/characters",
            queryItems: [URLQueryItem(name: "ts", value: ts),
                         URLQueryItem(name: "apikey", value: publicKey),
                         URLQueryItem(name: "hash", value: hash)])
    }
    
    static func charactersStartingWith(_ string: String) -> Self {
        let ts = Date().timeIntervalSince1970.description
        let publicKey = Bundle.main.infoDictionary?["MARVEL_PUBLIC_KEY"] as? String
        let privateKey = Bundle.main.infoDictionary?["MARVEL_PRIVATE_KEY"] as? String
        let hash = Crypto.md5(string: "\(ts)\(privateKey!)\(publicKey!)")
        return MarvelEndpoint(
            path: "/characters",
            queryItems: [URLQueryItem(name: "nameStartsWith", value: string),
                         URLQueryItem(name: "ts", value: ts),
                         URLQueryItem(name: "apikey", value: publicKey),
                         URLQueryItem(name: "hash", value: hash)])
    }
}

extension MarvelEndpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.path = "/v1/public" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components \(components)")
        }
        
        return url
    }
}
