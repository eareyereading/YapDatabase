
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YapDatabase",
    products: [
        .library(
            name: "YapDatabase",
            targets: ["YapDatabase"]
        ),
        .library(
            name: "YapDatabaseSwift",
            targets: ["YapDatabaseSwift"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "YapDatabase",
            dependencies: [],
            cSettings: [
                .headerSearchPath("privateInclude")
            ]
        ),
        .target(
            name: "YapDatabaseSwift",
            dependencies: ["YapDatabase"]
        )
    ]
)
