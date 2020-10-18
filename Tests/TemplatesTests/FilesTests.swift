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

  private let variations: VariationGenerator = { name, context in
    guard name == "defaults" else { return [(context: context, suffix: "")] }

    return [
      (
        context: context,
        suffix: ""
      ),
      (
        context: try StencilContext.enrich(context: context, parameters: ["bundle=ResourcesBundle.bundle"]),
        suffix: "-customBundle"
      ),
      (
        context: try StencilContext.enrich(
          context: context,
          parameters: ["enumName=FileList", "resourceTypeName=Resource"]
        ),
        suffix: "-customName"
      ),
      (
        context: try StencilContext.enrich(context: context, parameters: ["useExtension=false"]),
        suffix: "-dontUseExtension"
      ),
      (
        context: try StencilContext.enrich(context: context, parameters: ["preservePath"]),
        suffix: "-preservePath"
      ),
      (
        context: try StencilContext.enrich(context: context, parameters: ["publicAccess"]),
        suffix: "-publicAccess"
      )
    ]
  }

  func testStructuredSwift5() {
    test(
      template: "structured-swift5",
      contextNames: Contexts.all,
      directory: .files,
      contextVariations: variations
    )
  }

  func testFlatSwift5() {
    test(
      template: "flat-swift5",
      contextNames: Contexts.all,
      directory: .files,
      contextVariations: variations
    )
  }
}
