import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var box: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        box.backgroundColor = .green
        moveToRightBox()
        box.layer.cornerRadius = 50
        box.layer.shadowOffset = CGSizeMake(5, 5)
        box.layer.shadowOpacity = 0.7
        box.layer.shadowRadius = 5
        box.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        box.layer.borderColor = UIColor.blue.cgColor
        box.layer.borderWidth = 5
        box.layer.contents = UIImage(named: "Tree.jpg")?.cgImage
        box.layer.contentsGravity = CALayerContentsGravity.resize
        box.layer.masksToBounds = true
        box.layer.backgroundColor = UIColor.blue.cgColor
        box.layer.opacity = 0.5
    }
    func moveToRightBox() {
        box.frame.origin.x += 50
    }
}

