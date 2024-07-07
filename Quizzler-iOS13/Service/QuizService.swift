





import Foundation

enum APIKey {
    
    static var `defaul`: String {
        guard let filePath = Bundle.main.path(forResource: "Generative-Info", ofType: "plist")
        else {
            fatalError("Caminho para 'GenerativeAI-Info.plist' não encontrado.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("APIKey incorreta ou não encontrada.")
        }
        if value.starts(with: "_"){
            fatalError("Vejas as instruções para se criar uma APIKey.")
        }
        return value
    }
}

