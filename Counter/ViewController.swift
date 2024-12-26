//
//  ViewController.swift
//  Counter
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    private var count: UInt = 0
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        // formatter.dateFormat = "dd/MMM/yyyy HH:mm:ss"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func updateHistory(_ message: String) {
        historyTextView.text += "\n[\(dateFormatter.string(from: .now))]: \(message)"
        let bottom = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }

    @IBAction func increaseButtonDidTap(_ sender: Any) {
        count = count < UInt.max ? count + 1 : UInt.max
        counterLabel.text = count.description
        updateHistory("значение изменено на +1")
    }

    @IBAction func decreaseButtonDidTap(_ sender: Any) {
        // count = count > 0 ? count - 1 : 0
        if count > 0 {
            count = count - 1
            counterLabel.text = count.description
            updateHistory("значение изменено на -1")
        } else {
            updateHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }

    @IBAction func resetButtonDidTap(_ sender: Any) {
        count = 0
        counterLabel.text = count.description
        updateHistory("значение сброшено")
    }
}

