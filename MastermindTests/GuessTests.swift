@testable import Mastermind
import XCTest

final class GuessTests: XCTestCase {
    func test_createGuess_setsGuessSize() throws {
        let sut = Guess(secretSize: 2)
        XCTAssertEqual(sut[0], nil)
        XCTAssertEqual(sut[1], nil)
    }
    
    func test_size() throws {
        let sut = Guess(secretSize: 4)
        XCTAssertEqual(sut.size, 4)
    }
    
    func test_setAndGetAtIndices() throws {
        let sut = Guess(secretSize: 2)
        let choice0 = CodeChoice(color: .red, codeValue: 1)
        let choice1 = CodeChoice(color: .green, codeValue: 2)
        sut[0] = choice0
        sut[1] = choice1
        XCTAssertEqual(sut[0], choice0)
        XCTAssertEqual(sut[1], choice1)
    }
    
    func test_isObservable_soThatViewsCanObserveChanges() throws {
        let sut = Guess(secretSize: 2)
        XCTAssertTrue(sut is Observable)
    }
    
    func test_isNotComplete_withEmptySlot() throws {
        let sut = Guess(secretSize: 2)
        let choice0 = CodeChoice(color: .red, codeValue: 1)
        sut[0] = choice0
        XCTAssertFalse(sut.isComplete)
    }
}
