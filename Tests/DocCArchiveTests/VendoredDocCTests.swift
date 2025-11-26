import Testing
import VendoredDocC

@Test func verifyVersionExists() async throws {
  #expect(!VendoredDocC.VendoredVersion.description.isEmpty)
  #expect(!VendoredDocC.VendoredVersion.commit.isEmpty)
}
