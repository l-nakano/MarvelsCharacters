import Foundation
import Combine

final class CharactersViewModel {
    @Published private(set) var charactersList: [Character]
    
    private var completeCharactersList: [Character] = []
    
    private let charactersRepository = CharactersRepository()
    
    init() { charactersList = [] }
    
    func getCharactersList(completion: @escaping () -> Void) {
        charactersRepository.getCharacterList { characters in
            self.completeCharactersList = characters
            self.charactersList = characters
            completion()
        }
    }
    
    func getCharactersStartingWith(_ string: String, completion: @escaping () -> Void) {
        charactersRepository.getCharactersListStartingWith(string) { characters in
            self.charactersList = characters
            completion()
        }
    }
    
    func getCharacterImageData(_ character: Character, completion: @escaping (Data) -> Void) {
        charactersRepository.getCharacterImage(
            path: character.thumbnail.path,
            extension: character.thumbnail.extension,
            variant: .standard_medium) { data in
                completion(data!)
            }
    }
    
    func numbersOfPagesNeeded() -> Int {
        return Int(ceil(Double(charactersList.count) / 4))
    }
    
    func filteredCharacters(by queryString: String) {
        charactersList = completeCharactersList.filter{ $0.name.lowercased().contains(queryString) }
    }
    
    func resetFilteredCharactersList() {
        charactersList = completeCharactersList
    }
}
