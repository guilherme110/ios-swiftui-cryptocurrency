//
//  Transacao.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 31/03/22.
//

import Foundation

struct Transacao: Hashable, Codable, Identifiable {
    var id: Int
    var titulo: String
    var subtitulo: String
    var tipoAcao: String
    var usuarios: Usuario
}

struct Usuario: Hashable, Codable {
    var urlImg1: String
    var urlImg2: String
    var urlImg3: String
}
