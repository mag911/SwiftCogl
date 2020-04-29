// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Cogl",
    products: [
        .library(name: "Cogl", targets: ["Cogl"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mag911/SwiftGObject.git", .branch("master")),
    ],
    targets: [
	.systemLibrary(name: "CCogl", pkgConfig: "cogl-gl-1.0 cogl-path-1.0 ccairo glib-2.0 gio-unix-2.0",
	    providers: [
		.brew(["cogl", "cairo", "glib", "glib-networking", "gobject-introspection"]),
		.apt(["libcogl-gles2-dev", "libcogl-path-dev", "libcogl-dev", "libcairo2-dev", "libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
	    ]),
        .target(name: "Cogl", dependencies: ["CCogl", "GLibObject"]),
        .testTarget(name: "CoglTests", dependencies: ["Cogl"]),
    ]
)
