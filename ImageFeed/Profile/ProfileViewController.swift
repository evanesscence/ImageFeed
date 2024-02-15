import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private var profileImage: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var loginLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func logoutButton(_ sender: Any) {
        
    }
}
