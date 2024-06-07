// swift-tools-version: 5.10

import PackageDescription

let modulePlugins: [Target.PluginUsage] = [/*.plugin(name: "SwiftLintPlugin", package: "SwiftLint")*/]

let package = Package(
    name: "Modules",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "HappDependencies", targets: ["HappAuthorization", "HappUI", "HappEvents"]),
        .library(name: "HappAuthorization", targets: ["HappAuthorization"]),
        .library(name: "HappEvents", targets: ["HappEvents"]),
        .library(name: "HappUI", targets: ["HappUI"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/realm/SwiftLint.git", .upToNextMajor(from: "0.52.4"))
    ],
    targets: [
        .target(
            name: "HappAuthorization",
            dependencies: ["HappUI"],
            resources: [.process("Resources")],
            swiftSettings: [.define("SWIFT_EMIT_LOC_STRINGS")],
            plugins: modulePlugins
        ),
        .target(name: "HappUI", plugins: modulePlugins),
        .target(name: "HappEvents", dependencies: ["HappUI"])
    ]
)
