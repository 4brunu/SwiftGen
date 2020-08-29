//
// SwiftGenKit
// Copyright © 2020 SwiftGen
// MIT Licence
//

import Foundation
import PathKit

extension Files.Parser {
  public func stencilContext() -> [String: Any] {
    let files = self.files
      .sorted { lhs, rhs in lhs.name < rhs.name }
      .map(map(file:))

    return [
      "files": files
    ]
  }

  private func map(file: Files.File) -> [String: Any] {
    [
      "name": file.name,
      "ext": file.ext ?? "",
      "path": file.path.joined(separator: Path.separator),
      "mimeType": file.mimeType
    ]
  }
}
