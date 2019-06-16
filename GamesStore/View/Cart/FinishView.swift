import UIKit

protocol FinishViewDelegate {
    func finishCart()
    func goToRoot()
}

class FinishView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    
    var delegate: FinishViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    @IBAction func goToHome() {
        delegate?.goToRoot()
        print("Voltar")
    }
    
    @IBAction func finishCart() {
        delegate?.finishCart()
        print("Finalizar Compra")
    }
    
    private func setupView() {
        UINib(nibName: "FinishView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        
        finishButton.layer.cornerRadius = 5
    }

}
