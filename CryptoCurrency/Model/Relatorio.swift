//
//  Relatorio.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 15/04/22.
//

import Foundation

struct Relatorio: Hashable, Codable, Identifiable {
    let id: Int
    var titulo: String
    var precoAlvo: String
    var dataPublicacao: String
    var autor: String
    
    init(id: Int, titulo: String, precoAlvo: String, dataPublicacao: String, autor: String) {
        self.id = id
        self.titulo = titulo
        self.precoAlvo = precoAlvo
        self.dataPublicacao = dataPublicacao
        self.autor = autor
    }
}
