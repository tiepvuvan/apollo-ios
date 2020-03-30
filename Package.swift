// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Apollo",
    products: [
    .library(
      name: "Apollo",
      type: .dynamic,
      targets: ["Apollo"]),
    .library(
      name: "ApolloCodegenLib",
      type: .dynamic,
      targets: ["ApolloCodegenLib"]),
    .library(
        name: "ApolloSQLite",
        type: .dynamic,
        targets: ["ApolloSQLite"]),
    .library(
        name: "ApolloWebSocket",
        type: .dynamic,
        targets: ["ApolloWebSocket"]),
    ],
    dependencies: [
    .package(
      url: "https://github.com/stephencelis/SQLite.swift.git",
      .upToNextMinor(from: "0.12.2")),
    .package(
      url: "https://github.com/daltoniam/Starscream",
      .upToNextMinor(from: "3.1.1")),
    .package(
      url: "https://github.com/stencilproject/Stencil.git",
      .upToNextMinor(from: "0.13.1")),
    ],
    targets: [
    .target(
      name: "Apollo",
      dependencies: []),
    .target(
      name: "ApolloCodegenLib",
      dependencies: ["Stencil"]),
    .target(
      name: "ApolloSQLite",
      dependencies: ["Apollo", "SQLite"]),
    .target(
      name: "ApolloSQLiteTestSupport",
      dependencies: ["ApolloSQLite", "ApolloTestSupport"]),
	.target(
      name: "ApolloWebSocket",
      dependencies: ["Apollo","Starscream"]),
    .target(
      name: "ApolloTestSupport",
      dependencies: ["Apollo"]),
    .target(
      name: "GitHubAPI",
      dependencies: ["Apollo"]),
    .target(
      name: "StarWarsAPI",
      dependencies: ["Apollo"]),

    .testTarget(
      name: "ApolloTests",
      dependencies: ["ApolloTestSupport", "StarWarsAPI"]),
    .testTarget(
      name: "ApolloCacheDependentTests",
      dependencies: ["ApolloSQLiteTestSupport", "StarWarsAPI"]),
    .testTarget(
      name: "ApolloCodegenTests",
      dependencies: ["ApolloCodegenLib"]),
    .testTarget(
      name: "ApolloSQLiteTests",
      dependencies: ["ApolloSQLiteTestSupport", "StarWarsAPI"]),
    .testTarget(
      name: "ApolloWebsocketTests",
      dependencies: ["ApolloWebSocket", "ApolloTestSupport", "StarWarsAPI"]),
    ]
)
