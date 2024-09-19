import XCTest
@testable import ColorPalettePicker

final class ColorPalettePickerTests: XCTestCase {

    func testColorSelection() {
        let picker = ColorPalettePicker(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        let mockDelegate = MockDelegate()
        picker.delegate = mockDelegate
        picker.colors = [.red, .green, .blue]
        
        // Simulate selecting the second color (green)
        let greenButton = picker.subviews.compactMap { $0 as? UIButton }.first { $0.backgroundColor == .green }
        greenButton?.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(mockDelegate.selectedColor, .green)
    }
}

private class MockDelegate: ColorPalettePickerDelegate {
    var selectedColor: UIColor?

    func colorPalettePicker(_ picker: ColorPalettePicker, didSelect color: UIColor) {
        selectedColor = color
    }
}
