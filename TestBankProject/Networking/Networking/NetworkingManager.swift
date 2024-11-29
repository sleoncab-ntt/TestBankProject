
import Foundation

public class NetworkingManager {
    
   public static let shared = NetworkingManager()
        
   private init() {}
    
    public func fetchData<T: Decodable>(url: String) async -> T? {
        let url = URL(string: url)!
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(T.self, from: data)
                    return decodedData
                } catch {
                    print("No se pudo decodear la data")
                }
            }
        } catch {
            print(error)
        }
        return nil
    }
    
}
