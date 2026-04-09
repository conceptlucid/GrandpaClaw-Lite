// swift-tools-version: 5.9
import PackageDescription
let package = Package(
    name: "GrandpaClaw",
    platforms: [.macOS(.v13)],
    products: [.executable(name: "GrandpaClaw", targets: ["GrandpaClaw"])],
    dependencies: [],
    targets: [.executableTarget(name: "GrandpaClaw", path: "Sources")]
)
