//
// Templates UnitTests
// Copyright © 2020 SwiftGen
// MIT Licence
//

import StencilSwiftKit
import XCTest

final class FilesTests: XCTestCase {
  private enum Contexts {
    static let all = ["empty", "defaults"]
  }

  func testSwift5() {
    test(
      template: "swift5",
      contextNames: Contexts.all,
      directory: .files
    )
  }

  func testStructuredSwift5() {
    test(
      template: "structured-swift5",
      contextNames: ["structured"],
      directory: .files
    )
  }
}
