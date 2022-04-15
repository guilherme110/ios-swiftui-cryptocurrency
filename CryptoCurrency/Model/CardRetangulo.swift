    //
//  CardRetanguloModel.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 15/04/22.
//

import Foundation
import SwiftUI
    
struct CardRetangulo {
    let id = UUID()
    var titulo: String
    var subTitulo: String
    var corFundo: Color
    var corFonte: Color
    var addBorda: Bool
    
    init(titulo: String = "", subTitulo: String = "", corFundo: Color = Color.white, corFonte: Color = Color.black, addBorda: Bool = false) {
        
        self.titulo = titulo
        self.subTitulo = subTitulo
        self.corFundo = corFundo
        self.corFonte = corFonte
        self.addBorda = addBorda
    }
}
