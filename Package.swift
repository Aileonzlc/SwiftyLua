// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyLua",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13),],
    products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftyLua",
            targets: ["SwiftyLua", "lua4swift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        // .package(url: "https://github.com/Quick/Quick", from: "7.6.2"),
        // .package(url: "https://github.com/Quick/Nimble", from: "13.7.1")
    ],
    targets: [
        .target(
            name: "SwiftyLua",
            dependencies: ["lua4swift"]),
        .target(
            name: "CLua",
            path: "Sources/CLua",
            publicHeadersPath: "include"
        ),
        .target(
            name: "lua4swift",
            dependencies: ["CLua"],
            path: "Sources/lua4swift",
            linkerSettings: [.linkedLibrary("z"), .linkedFramework("Foundation")]
         ),
//        .testTarget(
//            name: "SwiftyLuaTests",
//            dependencies: [
//                .target(name: "SwiftyLua"),
//                .product(name: "Quick", package: "Quick"),
//                .product(name: "Nimble", package: "Nimble")
//            ],
//            resources: [.copy("LuaScripts")]),
        .testTarget(
            name: "SwiftyLuaSimpleTest",
            dependencies: [
                "SwiftyLua"
            ]
        )
    ],
    cLanguageStandard: .gnu99,
    cxxLanguageStandard: .cxx11
)
