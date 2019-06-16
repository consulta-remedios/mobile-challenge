import UIKit

class CheckoutController: UIViewController {
    
    @IBOutlet weak var iconCheckout: UIImageView!
    @IBOutlet weak var orderNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    @IBAction func goToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    fileprivate func configureNavigationBar() {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "icon-close"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(goToHome))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem!.tintColor =  UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        self.title = "Compra concluída"
        
        iconCheckout.image = iconCheckout.image?.withRenderingMode(.alwaysTemplate)
        iconCheckout.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
    }
}
