import Foundation

struct CharacterFetchResponse: Decodable {
    let status: String
    let data: CharacterData
}
