//
//  CartRepository.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 06/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

protocol CartRepositoryProtocol {
    func fetchAll(response: @escaping ([CartItem]?, String) -> Void)
    func getSubTotal(response: @escaping (Double?, String) -> Void)
    func getTotal(response: @escaping (Double?, String) -> Void)
    func getFreight(response: @escaping (Double?, String) -> Void)
    func removeAll()
}

struct CartRepository: CartRepositoryProtocol {
    let cart: CartSingleton
    
    init(cart: CartSingleton) {
        self.cart = cart
    }
    
    func fetchAll(response: @escaping ([CartItem]?, String) -> Void) {
        response(cart.items, "Success")
    }
    
    func getSubTotal(response: @escaping (Double?, String) -> Void) {
        response(cart.subTotal, "Success")
    }
    
    func getTotal(response: @escaping (Double?, String) -> Void) {
        response(cart.total, "Success")
    }
    
    func getFreight(response: @escaping (Double?, String) -> Void) {
        response(cart.freight, "Success")
    }
    
    func removeAll() {
        cart.removeAll()
    }
}
