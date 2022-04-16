//
//  RelatoriosView-ViewModel.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 16/04/22.
//

import Foundation
import Combine

class RelatoriosViewModel: ObservableObject {
    private let urlString = "http://localhost:3000/relatorios"
    private var task: AnyCancellable?
    
    @Published var listaRelatorios: [Relatorio] = []
    
    init() {
        self.buscaRelatorios()
    }
    
    func buscaRelatorios() {
        let session = URLSession.shared
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                self.handleServerError(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
                self.handleClientError(response)
                return
            }
            
            guard let mime = response?.mimeType, mime == "application/json" else {
                print("Tipo MIME diferente de application/json")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
                
                let decoder = JSONDecoder()
                self.listaRelatorios = try decoder.decode([Relatorio].self, from: data!)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        
        task.resume()
    }
    
    func handleClientError(_ response: URLResponse?) {
        print(response ?? "")
    }
    
    func handleServerError(_ error: Error?) {
        print(error ?? "")
    }
}
