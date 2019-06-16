//
//  GameDetailController.swift
//  ConsultaRemedio
//
//  Created by Marcio Habigzang Brufatto on 27/02/19.
//  Copyright © 2019 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit
import RealmSwift

class GameDetailController: UIViewController {

    @IBOutlet weak var shippingImage: UIImageView!
    @IBOutlet weak var addCartButton: UIButton!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var titleGame: UILabel!
    @IBOutlet weak var descriptionGame: UILabel!
    @IBOutlet weak var priceGame: UILabel!
    @IBOutlet weak var shippingPrice: UILabel!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        configureNavigationBar()
        loadImage()
        
        titleGame.text = game.name
        descriptionGame.text = game.gameDescription
        priceGame.text = String().currencyFormatter(price: game.price)
        shippingPrice.text = String().currencyFormatter(price: 10.0)
    }
    
    @IBAction func addGameInCart() {
        Cart().addGameInCart(game: game)
        goToCart()
    }
    
    @IBAction func readMore() {
        let alertController = UIAlertController(title: "", message: game.gameDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func goToCart(){
        performSegue(withIdentifier: "cartSegue", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cartGame" {
            let _ = segue.destination as?
                CartController
        }
    }
}

extension GameDetailController {
    
    fileprivate func configureLayout() {
        shippingImage.image = shippingImage.image?.withRenderingMode(.alwaysTemplate)
        shippingImage.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
    
        addCartButton.leftImage(image: UIImage(named: "icon-cart")!, renderMode: .alwaysTemplate)
    
        addCartButton.layer.cornerRadius = 5
    }
    
    fileprivate func loadImage() {
        
        gameImage.af_setImage(withURL: URL(string: game.image)!,
                               placeholderImage: UIImage(named: "super_mario"),
                               imageTransition: .crossDissolve(0.2),
                               completion: { response in
                                self.gameImage.image = response.result.value
        })
    }
    
    fileprivate func configureNavigationBar() {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "icon-close"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem!.tintColor =  UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        self.title = game.platform
        let  cartButton = UIBarButtonItem(image: UIImage(named: "icon-cart"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(goToCart))
        self.navigationItem.rightBarButtonItem = cartButton
        
    }
}
