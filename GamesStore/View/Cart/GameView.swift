import UIKit

class GameView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gamePrice: UILabel!
    @IBOutlet weak var gameCount: UILabel!
    @IBOutlet weak var gameCountBackground: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        UINib(nibName: "GameView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        
        gameCountBackground.layer.cornerRadius = 6
        gameCountBackground.layer.shadowColor = UIColor.gray.cgColor
        gameCountBackground.layer.shadowOpacity = 0.8
        gameCountBackground.layer.shadowOffset = CGSize.zero
        gameCountBackground.layer.shadowRadius = 5
    }

}
