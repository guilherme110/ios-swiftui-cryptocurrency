//
//  Dados.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 31/03/22.
//

import Foundation

//let transacoes: [Transacao] = load("MockListaTransacoes.json")
//let transacoesRealizadas: [TransacaoRealizada] = load("MockListaTransacoesRealizadas.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

