# ColorPalettePicker

`ColorPalettePicker` is a Swift package for iOS that provides a customizable color palette picker. It allows users to select a color from a predefined set and notifies the delegate of the selected color.

## Features

- Easy to integrate.
- Customizable color palette.
- Delegate callback for color selection.

## Requirements

- iOS 15.0+
- Swift 5.0+

## Installation

Add the package via Swift Package Manager:

1. In Xcode, go to **File** > **Add Packages**.
2. Enter the repository URL: `https://github.com/yektaokdan/ColorPalettePicker`.
3. Choose the version and add the package.

### Customization

You can customize the `ColorPalettePicker` by changing the following properties:

- `colors`: An array of `UIColor` representing the palette. You can provide any custom colors.
- `itemSize`: The size of each color circle in the palette. Default is 40x40.
- `spacing`: The space between color items. Default is 10.
- `cornerRadius`: The corner radius for each color item. Default is 20 (for circular items).

Example:

```swift
let colorPicker = ColorPalettePicker(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 50))
colorPicker.delegate = self
colorPicker.colors = [.red, .green, .blue, .yellow, .orange]
colorPicker.itemSize = CGSize(width: 50, height: 50)
colorPicker.spacing = 15
colorPicker.cornerRadius = 25
view.addSubview(colorPicker)


## Usage

### Import the Library

import ColorPalettePicker
import UIKit
import ColorPalettePicker

class ViewController: UIViewController, ColorPalettePickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let colorPicker = ColorPalettePicker(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 50))
        colorPicker.delegate = self
        colorPicker.colors = [.red, .green, .blue]
        view.addSubview(colorPicker)
    }

    func colorPalettePicker(_ picker: ColorPalettePicker, didSelect color: UIColor) {
        view.backgroundColor = color
        print("Selected color: \(color)")
    }
}

