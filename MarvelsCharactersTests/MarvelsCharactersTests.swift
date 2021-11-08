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
    
    func testApiSuccessfulConnection() throws {
        try XCTSkipUnless(networkMonitor.isReachable, "Network connectivity needed for this test")
        
        // Dado
        let marvelEndpoint = MarvelEndpoint.characters()
        let url = marvelEndpoint.url
        print(url)
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

}
