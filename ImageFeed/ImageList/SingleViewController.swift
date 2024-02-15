import UIKit

final class SingleViewController: UIViewController {
    var image: UIImage? {
        didSet {
            guard isViewLoaded else { return }
                imageView.image = image
        }
    }

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
