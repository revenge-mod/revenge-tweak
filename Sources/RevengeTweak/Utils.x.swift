import Foundation

func getPyoncordDirectory() -> URL {
  let documentDirectoryURL = try! FileManager.default.url(
      for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

  let pyoncordFolderURL = documentDirectoryURL.appendingPathComponent("pyoncord")

  // Create the "pyoncord" folder if it doesn't exist
  if !FileManager.default.fileExists(atPath: pyoncordFolderURL.path) {
      try! FileManager.default.createDirectory(
        at: pyoncordFolderURL, withIntermediateDirectories: true, attributes: nil)
  }

  return pyoncordFolderURL
}
