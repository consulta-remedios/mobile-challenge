
import UIKit

class GameCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var platform: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image?.image = nil
        platform.text = nil
        name.text = nil
        price.text = nil
    }
}
