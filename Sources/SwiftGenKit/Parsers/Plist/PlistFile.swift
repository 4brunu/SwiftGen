//
//  PlistFile.swift
//  SwiftGenKit
//
//  Created by David Jennes on 04/05/2018.
//  Copyright © 2018 AliSoftware. All rights reserved.
//

import Foundation
import PathKit

public extension Plist {
  struct File {
    let path: Path
    let name: String
    let document: Any

    init(path: Path, relativeTo parent: Path? = nil) throws {
      self.path = parent.flatMap { path.relative(to: $0) } ?? path
      self.name = path.lastComponentWithoutExtension

      if let data = NSDictionary(contentsOf: path.url) as? [String: Any] {
        self.document = data
      } else if let data = NSArray(contentsOf: path.url) as? [Any] {
        self.document = data
      } else {
        throw ParserError.invalidFile(path: path, reason: "Unknown plist contents")
      }
    }
  }
}
