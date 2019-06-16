import Foundation
import UIKit

extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.imageView?.image = image.imageResize(sizeChange: CGSize(width: 8, height: 8))
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: image.size.width / 2)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
        
        self.imageView?.image = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.imageView?.tintColor = UIColor.white
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}
