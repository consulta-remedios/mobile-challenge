//
//  MyViewController.swift
//  my-games
//
//  Created by Caio Cardozo on 04/02/19.
//  Copyright © 2019 CaioCardozo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

private var loaderViewAssociationKey: NVActivityIndicatorView?


extension UIViewController {
    
    var loaderView: NVActivityIndicatorView! {
        get { return objc_getAssociatedObject(self, &loaderViewAssociationKey) as? NVActivityIndicatorView }
        set(newValue) { objc_setAssociatedObject(self, &loaderViewAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    func lockView(_ view: UIView){
        view.isUserInteractionEnabled = false
    }
    
    func unlockView(_ view: UIView) {
        view.isUserInteractionEnabled = true
    }
    
    func showLoader() {
        //configurar o loading Indicator aqui
        if(loaderView == nil) {
            loaderView = NVActivityIndicatorView(frame: CGRect(x: (UIScreen.main.bounds.size.width/2) - 15, y: (UIScreen.main.bounds.size.height/2), width: CGFloat(35), height: CGFloat(35)), type: NVActivityIndicatorType.circleStrokeSpin, color: UIColor.appColor(.main), padding: 0)
        }
        
        self.lockView(self.view)
        
        if(loaderView.isAnimating == false){
            loaderView.startAnimating()
        }
        
        if self.navigationController ==  nil {
            self.view.addSubview(loaderView)
        }
        else {
            self.navigationController?.view.addSubview(loaderView)
        }
        
    }
    
    func hideLoader () {
        if(loaderView != nil){
            self.unlockView(self.view)
            loaderView.stopAnimating()
            loaderView.removeFromSuperview()
        }
    }
    
    // MARK: - navigation
    func setupBack() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
    }
    
    //define as cores da navigation
    func setupNavigationAppearance(navBar: UINavigationBar){
        navBar.tintColor = UIColor.appColor(.main)
        navBar.barTintColor = UIColor.appColor(.main)
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    //cria o botao voltar
    //MARK: - BackButton
    func createBackButton(onBack: Selector? = nil, buttonTitle: String? = "") {
        let backbutton = UIButton(frame: CGRect(x: 0, y: 0, width: 38, height: 42))
        backbutton.tintColor = UIColor.white
        backbutton.imageView?.contentMode = .left
        backbutton.setTitle(buttonTitle, for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        backbutton.setImage(UIImage(named: "ic_back"), for: .normal)
        if onBack != nil {
            backbutton.addTarget(self, action: onBack!, for: .touchUpInside)
        } else {
            backbutton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - ShowModal
    func showModal(viewController controller: UIViewController) {
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        self.present(controller, animated: true, completion: nil)
    }
    
    // MARK: - ShowModaldefault
    func showModalDefault(title: String?, message: String?, textButton: String?){
        let modalDefault = ModalViewController(title: title, message: message, textButton: textButton, okBlock: nil)
        self.showModal(viewController: modalDefault)
    }
}
