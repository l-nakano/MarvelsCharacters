import Alamofire
import XCTest
@testable import MarvelsCharacters

class MarvelsCharactersTests: XCTestCase {
    
    var sut: Session!
    let networkMonitor = NetworkMonitor.shared

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AF
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testCharacterSuccessfulConnection() throws {
        try XCTSkipUnless(networkMonitor.isReachable, "Network connectivity needed for this test")
        
        // Dado
        let marvelEndpoint = MarvelEndpoint.characters()
        let url = marvelEndpoint.url
        let expectation = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // Quando
        sut.request(url)
            .response { httpResponse in
                statusCode = httpResponse.response?.statusCode
                responseError = httpResponse.error
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 5)
        
        // Então
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testCharacterStartingWithSuccessfulConnection() throws {
        try XCTSkipUnless(networkMonitor.isReachable, "Network connectivity needed for this test")
        
        // Dado
        let marvelEndpoint = MarvelEndpoint.charactersStartingWith("sp")
        let url = marvelEndpoint.url
        let expectation = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // Quando
        sut.request(url)
            .response { httpResponse in
                statusCode = httpResponse.response?.statusCode
                responseError = httpResponse.error
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 5)
        
        // Então
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testFetchingCaracters() throws {
        try XCTSkipUnless(networkMonitor.isReachable, "Network connectivity needed for this test")
        
        // Dado
        let marvelService = MarvelService()
        let expectation = expectation(description: "Completion handler invoked")
        var characters: [Character]?
        var fetchStatus: String?
        
        // Quando
        marvelService.fetchCharacters { characterData in
            characters = characterData.data.results
            fetchStatus = characterData.status
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        
        //Então
        XCTAssertEqual(fetchStatus, "Ok")
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters?.count, 20)
    }
    
    func testFetchingCharactersStartingWith() throws {
        try XCTSkipUnless(networkMonitor.isReachable, "Network connectivity needed for this test")
        
        // Dado
        let marvelService = MarvelService()
        let expectation = expectation(description: "Completion handler invoked")
        var characters: [Character]?
        var fetchStatus: String?
        
        // Quando
        marvelService.fetchCharactersStartingWith("spider-m") { characterData in
            characters = characterData.data.results
            fetchStatus = characterData.status
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        
        //Então
        XCTAssertEqual(fetchStatus, "Ok")
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters?.count, 13)
    }

}
