import XCTest

@testable import magic

class CardTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCardImagesExist() {
        Card.All().forEach() { card in
            let imageFileName = card.getSetCode() + String(card.getCollectorsNumber()) + "full"
            XCTAssert(UIImage(named: imageFileName) != nil, "Image for card " + card.getName() + " (" + card.getSetCode() + " " + String(card.getCollectorsNumber()) + ") not found")
        }
    }
    
    func testCardTypes() {
        Card.All().forEach() { card in
            XCTAssert(!card.types.isEmpty)
        }
    }
}
