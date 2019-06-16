import UIKit
import RealmSwift
import AlamofireImage

class CartController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    var games: Results<Cart>?
    var cartTotalValue: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureNavigationBar()
        loadGames()
        if (games?.count)! > 0 {
            calculateTotal()
            addGames()
            addClientAddress()
            addShipping()
            addPayment()
            addFinishCart()
        } else {
            print("Não exite produtos no carrinho")
        }
    }
    
    fileprivate func calculateTotal() {
        cartTotalValue = Cart().calculateTotal()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkoutSegue" {
            let _ = segue.destination as? CheckoutController
        }
    }
}

extension CartController {
    
    fileprivate func loadGames() {
        let realm = try! Realm()
        games = realm.objects(Cart.self)
    }
    
    fileprivate func configureLayout() {
        
        self.view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 2
        stackView.distribution = .fill
        scrollView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    fileprivate func addGames() {
        
        for game in games! {
            let gameView = GameView()
            stackView.addArrangedSubview(gameView)
            gameView.translatesAutoresizingMaskIntoConstraints = false
            
            gameView.gameName.text = game.name
            gameView.gamePrice.text = String().currencyFormatter(price: game.price)
            
            gameView.gameImage.af_setImage(withURL: URL(string: game.image)!,
                                          placeholderImage: UIImage(named: "super_mario"),
                                          imageTransition: .crossDissolve(0.2),
                                          completion: { response in
                                            gameView.gameImage.image = response.result.value
            })
            gameView.gameCount.text = "\(game.count)"
        }
    }
    
    fileprivate func addClientAddress() {
        let clientAddress = ClientAddressView()
        stackView.addArrangedSubview(clientAddress)
        clientAddress.translatesAutoresizingMaskIntoConstraints = false
        clientAddress.heightAnchor.constraint(equalToConstant: CGFloat(130)).isActive = true
    }
    
    fileprivate func addShipping() {
        let shippingView = ShippingView()
        stackView.addArrangedSubview(shippingView)
        shippingView.translatesAutoresizingMaskIntoConstraints = false
        shippingView.heightAnchor.constraint(equalToConstant: CGFloat(86)).isActive = true
        
        shippingView.shippingPrice.text = String().currencyFormatter(price:  Cart().calculateShipping(total: cartTotalValue))
    }
    
    fileprivate func addPayment() {
        let paymentView = PaymentView()
        stackView.addArrangedSubview(paymentView)
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        paymentView.heightAnchor.constraint(equalToConstant: CGFloat(96)).isActive = true
    }
    
    
    fileprivate func addFinishCart() {
        let finishView = FinishView()
        stackView.addArrangedSubview(finishView)
        finishView.translatesAutoresizingMaskIntoConstraints = false
        finishView.heightAnchor.constraint(equalToConstant: CGFloat(122)).isActive = true
        
        finishView.cartPrice.text = String().currencyFormatter(price: cartTotalValue)
        
        finishView.delegate = self
    }
    
    
    fileprivate func configureNavigationBar() {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "icon-close"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(goToHome))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem!.tintColor =  UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        self.title = "Carrinho de Compras"
    }
    
    @objc func goToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension CartController: FinishViewDelegate {
    
    func goToRoot() {
        self.goToHome()
    }
    
    func finishCart() {
        
        GamesService.shared.checkout(completionHandler: {(checkout, err) in
            if let err = err {
                print("Failed to checkout:", err)
                return
            }
            let realm = try! Realm()
            try! realm.write {
                realm.deleteAll()
            }
            self.performSegue(withIdentifier: "checkoutSegue", sender: nil)
        })
    }
}
