import Foundation
import UIKit

final class ImagesListCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    static let reuseIdentifier = "ImagesListCell"
}
