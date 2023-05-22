# URL Composer

URL Composer is a lightweight Swift library that provides a convenient way to construct URLs with query parameters. It simplifies URL construction by offering a clean and expressive syntax for building URLs, including support for optional and multiple query parameters.

## Features

-   Create URLs with query parameters using a fluent API
-   Support for optional and multiple query parameters
-   URL encoding for safe inclusion of special characters and non-ASCII characters in URLs
-   Lightweight and easy to use

## Installation

To use URL Composer in your project, simply add it to your dependencies in your `Package.swift` file:
```swift
   dependencies: [ .package(url: "https://github.com/sasha-riabchuk/SwiftURLComposer", from: "1.0.0") ]
```
## Usage

Here's an example of how to use URL Composer to construct a URL with query parameters:
```swift
Domain(scheme: .https, domain: "csas.cz") {
    Path(path: "/application/csas") {
        QueryItem(key: "id", value: "someID")
        QueryItem(key: "id2", value: "someID2")
        QueryItem(key: "id3", value: "someID3")
        QueryItem(key: "id4", value: "someID4")
    }
}
```
This code creates a new URLComposer instance, sets the scheme, host, and path components of the URL, adds query parameters, and builds the URL. The resulting URL is printed to the console.

