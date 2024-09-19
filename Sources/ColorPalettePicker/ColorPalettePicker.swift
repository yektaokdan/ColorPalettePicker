// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

public class ColorPalettePicker: UIView {
    
    // Delegate to inform the selected colorrm -rf ~/Library/Developer/Xcode/DerivedData

    public weak var delegate: ColorPalettePickerDelegate?
    
    // Array of colors for the palette
    public var colors: [UIColor] = [.red, .blue, .green, .yellow, .orange, .purple, .brown] {
        didSet {
            setupPalette()
        }
    }
    
    private var colorButtons: [UIButton] = []
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupPalette()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPalette()
    }
    
    private func setupPalette() {
        // Clear any existing buttons
        colorButtons.forEach { $0.removeFromSuperview() }
        colorButtons.removeAll()
        
        // Create a button for each color
        for color in colors {
            let button = UIButton()
            button.backgroundColor = color
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.addTarget(self, action: #selector(colorSelected(_:)), for: .touchUpInside)
            colorButtons.append(button)
            addSubview(button)
        }
        setNeedsLayout()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let buttonSize: CGFloat = bounds.width / CGFloat(colorButtons.count)
        for (index, button) in colorButtons.enumerated() {
            button.frame = CGRect(x: CGFloat(index) * buttonSize, y: 0, width: buttonSize, height: bounds.height)
        }
    }
    
    @objc private func colorSelected(_ sender: UIButton) {
        if let color = sender.backgroundColor {
            delegate?.colorPalettePicker(self, didSelect: color)
        }
    }
}

// Protocol for color selection callback
public protocol ColorPalettePickerDelegate: AnyObject {
    func colorPalettePicker(_ picker: ColorPalettePicker, didSelect color: UIColor)
}
