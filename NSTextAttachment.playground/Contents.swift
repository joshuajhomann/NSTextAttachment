//: Playground - noun: a place where people can play

import PlaygroundSupport
import UIKit

class ViewController: UIViewController {
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let expression = "5 * 5"
        let substitutions: [Character: NSAttributedString] = ["*": NSAttributedString(image: UIImage(named: "star.png"))]
        let attributedExpression = NSMutableAttributedString(string: expression).applyingAttributedSubstitutions(dictionary: substitutions)
        label.attributedText = attributedExpression
        label.sizeToFit()
        
    }
}

extension NSAttributedString {
    public convenience init(image: UIImage?) {
        let attachment = NSTextAttachment()
        attachment.image = image
        self.init(attachment: attachment)
        
    }
    func applyingAttributedSubstitutions(dictionary: [Character: NSAttributedString]) -> NSAttributedString {
        let target = NSMutableAttributedString()
        for character in self.string {
            target.append(dictionary[character] ?? NSAttributedString(string: String(character)))
        }
        return target as NSAttributedString
    }
}

PlaygroundPage.current.liveView = ViewController()




