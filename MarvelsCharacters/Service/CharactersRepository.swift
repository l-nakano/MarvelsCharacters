import Foundation

final class CharactersRepository {
    let service = MarvelService()
    
    func getCharacterList(completion: @escaping ([Character]) -> Void) {
        service.fetchCharacters { characterResponse in
            completion(characterResponse.data.results)
        }
    }
    
    func getCharactersCount(completion: @escaping (Int) -> Void) {
        service.fetchCharacters { characterResponse in
            completion(characterResponse.data.count)
        }
    }
}
