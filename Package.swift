// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AsyncSwiftData",
    platforms: [.iOS(.v17)],
    dependencies: []
)

package.products = [
    .library(
        name: "AsyncSwiftDataCore",
        targets: [.core]
    ),
    .library(
        name: "AsyncSwiftDataRepository",
        targets: [.core, .repository]
    )
]

package.targets = [
    .target(name: .core),
    .target(
        name: .repository,
        dependencies: [
            .target(name: .core)
        ]
    ),
//    .testTarget(
//        name: .repositoryTests,
//        dependencies: [
//            .target(name: .core),
//            .target(name: .repository)
//        ]
//    )
]

private extension String {
    static let core = "Core"
    static let repository = "Repository"

    // MARK: ForTests
    static let repositoryTests = "RepositoryTests"
}
