import Foundation
import Alamofire
import AlamofireObjectMapper

class Service {
    static let shared = Service()
    
    let baseUrl = "https://game-checkout.herokuapp.com"
    let token = "QceNFo1gHd09MJDzyswNqzStlxYGBzUG"
    
    func fetchGames(page: Int = 0, completionHandler: @escaping([Game?], NSError?) ->()) {
        
        let headers: HTTPHeaders = [
            "TOKEN": token
        ]
        
        Alamofire.request(baseUrl + "/games", method: .get, headers: headers)
            .responseArray { (response: DataResponse<[Game]>) in
                switch response.result {
                case .success:
                    if response.response?.statusCode == 202 {
                        completionHandler([], nil)
                    } else if response.response?.statusCode == 200 {
                        completionHandler(response.result.value!, nil)
                    }
                case .failure(let error):
                    completionHandler([], error as NSError)
                }
        }
    }
    
    func checkout(page: Int = 0, completionHandler: @escaping(Bool, NSError?) ->() ){
        let headers: HTTPHeaders = [
            "TOKEN": token
        ]
        
        Alamofire.request(baseUrl + "/checkout" , method: .post, headers: headers)
            .responseString { response in
                switch response.result {
                case .success:
                    if response.response?.statusCode == 202 {
                        completionHandler(false, nil)
                    } else if response.response?.statusCode == 200 {
                        completionHandler(true, nil )
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(false, error as NSError)
                }
        }
    }
}
