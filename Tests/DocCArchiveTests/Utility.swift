import Foundation

enum TestFixtures {
  // These map to the structure of test fixtures embedded as resources within the Swift package
  static var exampleDocs: URL? {
    return Bundle.module.url(
      forResource: "ExampleDocs", withExtension: "doccarchive", subdirectory: "Fixtures")
  }
  static var sampleLibrary: URL? {
    return Bundle.module.url(
      forResource: "SampleLibrary", withExtension: "doccarchive", subdirectory: "Fixtures")
  }
}

//    /// Creates a new temporary directory and returns the URL of that directory.
//    ///
//    /// After the current test method has returned the temporary directory is automatically removed.
//    ///
//    /// - Parameters:
//    ///   - pathComponents: The name of the temporary directory.
//    /// - Returns: The URL of the newly created directory.
//    func createTemporaryDirectory(named: String) throws -> URL {
//        try createTemporaryDirectory(pathComponents: named)
//    }
//
//    /// Creates a new temporary directory and returns the URL of that directory.
//    ///
//    /// After the current test method has returned the temporary directory is automatically removed.
//    ///
//    /// - Parameters:
//    ///   - pathComponents: Additional path components to add to the temporary URL.
//    /// - Returns: The URL of the newly created directory.
//    func createTemporaryDirectory(pathComponents: String...) throws -> URL {
//        let bundleParentDir = Bundle(for: Self.self).bundleURL.deletingLastPathComponent()
//        let baseURL = bundleParentDir.appendingPathComponent(name.replacingWhitespaceAndPunctuation(with: "-"))
//
//        var tempURL = baseURL.appendingPathComponent(ProcessInfo.processInfo.globallyUniqueString)
//        for component in pathComponents {
//            tempURL.appendPathComponent(component)
//        }
//        tempURL.standardize()
//
//        addTeardownBlock {
//            do {
//                if FileManager.default.fileExists(atPath: baseURL.path) {
//                    try FileManager.default.removeItem(at: baseURL)
//                }
//            } catch {
//                XCTFail("Failed to remove temporary directory: '\(error)'")
//            }
//        }
//
//        if !FileManager.default.fileExists(atPath: bundleParentDir.path) {
//            // Create the base URL directory without intermediate directories so that an error is raised if the parent directory doesn't exist.
//            try FileManager.default.createDirectory(at: baseURL, withIntermediateDirectories: false, attributes: nil)
//        }
//
//        try FileManager.default.createDirectory(at: tempURL, withIntermediateDirectories: true, attributes: nil)
//
//        return tempURL
//    }
