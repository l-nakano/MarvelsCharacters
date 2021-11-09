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
