//
//  Opcao.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 14/04/22.
//

import Foundation

struct Opcao: Identifiable {
    var id = UUID()
    var selecionada = false
    var texto = ""
    
    init(selecionada: Bool = false, texto: String) {
        self.selecionada = selecionada
        self.texto = texto
    }
}
