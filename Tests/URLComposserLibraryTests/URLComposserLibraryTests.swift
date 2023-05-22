@testable import URLComposserLibrary
import XCTest

final class URLComposserLibraryTests: XCTestCase {
    func testSimpleDomainWithPath() throws {
        // Create a Domain object with HTTPS scheme and "csas.cz" domain, with a path "/application/csas" and no query parameters
        let result = try Domain(scheme: .https, domain: "csas.cz") {
            Path(path: "/application/csas", queryItems: [])
        }()

        // Verify that the resulting URL is "https://csas.cz/application/csas?#"
        XCTAssertEqual(result.absoluteString, "https://csas.cz/application/csas?")
    }

    func testSimpleDomainWithPathAndQuery() throws {
        // Create a Domain object with HTTPS scheme and "csas.cz" domain, with a path "/application/csas" and a query parameter "id=someID"
        let result = try Domain(scheme: .https, domain: "csas.cz") {
            Path(path: "/application/csas") {
                QueryItem(key: "id", value: "someID")
            }
        }()

        // Verify that the resulting URL is "https://csas.cz/application/csas?id=someID#"
        XCTAssertEqual(result.absoluteString, "https://csas.cz/application/csas?id=someID")
    }

    func testSimpleDomainWithPathAndFewQuery() throws {
        // Create a Domain object with HTTPS scheme and "csas.cz" domain, with a path "/application/csas" and multiple query parameters
        let result = try Domain(scheme: .https, domain: "csas.cz") {
            Path(path: "/application/csas") {
                QueryItem(key: "id", value: "someID")
                QueryItem(key: "id2", value: "someID2")
                QueryItem(key: "id3", value: "someID3")
                QueryItem(key: "id4", value: "someID4")
            }
        }()

        // Verify that the resulting URL contains all the specified query parameters
        XCTAssertEqual(result.absoluteString, "https://csas.cz/application/csas?id=someID&id2=someID2&id3=someID3&id4=someID4")
    }

    func testWithEncodedString() throws {
        // Create a Domain object with HTTPS scheme and "csas.cz" domain, with a path "/application/csas" and a query parameter "access_token={tokenx}"
        let result = try Domain(scheme: .https, domain: "csas.cz") {
            Path(path: "/application/csas") {
                QueryItem(key: "access_token", value: "{tokenx}")
            }
        }
        .asData()
        .base64EncodedString()

        // Verify that the resulting encoded string matches the expected value
        XCTAssertEqual(result, "aHR0cHM6Ly9jc2FzLmN6L2FwcGxpY2F0aW9uL2NzYXM/YWNjZXNzX3Rva2VuPSU3QnRva2VueCU3RCM=")
    }
}
