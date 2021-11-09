import Combine

final class CharactersViewModel {
    @Published private(set) var charactersList: [Character]
    
    private let charactersRepository = CharactersRepository()
    
    init() { charactersList = [] }
    
    func getCharactersList(completion: @escaping () -> Void) {
        charactersRepository.getCharacterList { characters in
            self.charactersList = characters
            completion()
        }
    }
}
