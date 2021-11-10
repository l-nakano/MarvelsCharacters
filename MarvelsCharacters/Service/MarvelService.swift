import Foundation
import Alamofire

final class MarvelService {
    func fetchCharacters(completion: @escaping (CharacterFetchResponse) -> Void) {
        let endpoint = MarvelEndpoint.characters()
        let url = endpoint.url
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("Fetch Characters Validation Successful")
                case let .failure(error):
                    print("Error fecthing characters: \(error)")
                }
            }
            .responseDecodable(of: CharacterFetchResponse.self, queue: .main) { response in
                guard let characters = response.value else { return }
                completion(characters)
            }
    }
    
    func fetchCharactersStartingWith(_ string: String, completion: @escaping (CharacterFetchResponse) -> Void) {
        let endpoint = MarvelEndpoint.charactersStartingWith(string)
        let url = endpoint.url
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("Fetch Characters Validation Successful")
                case let .failure(error):
                    print("Error fecthing characters: \(error)")
                }
            }
            .responseDecodable(of: CharacterFetchResponse.self, queue: .main) { response in
                guard let characters = response.value else { return }
                completion(characters)
            }
    }
    
    func fetchCharacterImage(path: String, extension: String, variant: ThumbnailVariant, completion: @escaping (Data?) -> Void) {
        let url = path.replacingOccurrences(of: "http", with: "https") + "/" + "\(variant)" + "." + `extension`
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("Fetch Characters Image Validation Successful")
                    completion(response.data)
                case let .failure(error):
                    print("Error fecthing characters: \(error)")
                }
            }
    }
}
