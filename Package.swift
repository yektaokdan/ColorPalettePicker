// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorPalettePicker",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ColorPalettePicker",
            targets: ["ColorPalettePicker"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ColorPalettePicker",

            dependencies: [],
            path: "Sources",

            exclude: [],
            publicHeadersPath: nil
        ),
        .testTarget(
            name: "ColorPalettePickerTests",
            dependencies: ["ColorPalettePicker"],
            path: "Tests"
        )
    ]
)
