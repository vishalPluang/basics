import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true;

struct HttpUtility
{
    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            
        URLSession.shared.dataTask(with: urlRequest) { (data, httpRespnse, error) in
            if(data != nil && data?.count != 0)
            {
                do
                {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let error
                {
                    print("decoding error \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

struct Endpoint
{
    static let registerUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
    static let getUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
}

struct UserRegistrationRequest: Encodable
{
    let name, email, password : String
}

struct UserRegistrationResponse: Decodable
{
    let errorMessage: String
    let data: UserData
}

struct UserData: Decodable
{
    let name,email, id, joining: String
}

struct User
{
    let httpUtility: HttpUtility
    
    init(_httpUtility: HttpUtility)
    {
        httpUtility = _httpUtility
    }
    
    func registerUserWithEncodableProtocol()
    {
        let urlRequest = URL(string: Endpoint.registerUser)
        let request = UserRegistrationRequest(name: "vishal", email: "vishal@gmail.com", password: "12345")
        
        do
        {
            let requestBody = try JSONEncoder().encode(request)
            httpUtility.postApiData(requestUrl: urlRequest!, requestBody: requestBody, resultType: UserRegistrationResponse.self){(userRegResponse) in
                if(userRegResponse.errorMessage.isEmpty)
                {
                    print(userRegResponse.data.name)
                }
            }
        }
        catch let error
        {
            print("error occured \(error.localizedDescription)")
        }
    }

    func registerUser()
    {
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        
        let dataDict = ["name" : "vishal", "email": "vishal@gmail.com", "password": "2345"]
        do
        {
            let requestBody = try JSONSerialization.data(withJSONObject: dataDict, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        }
        catch let error
        {
            print("error occured \(error.localizedDescription)")
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpRespnse, error) in
            if(data != nil && data?.count != 0)
            {
                let response = String(data: data!, encoding: .utf8)
                print(response!)
            }
        }.resume()
    }
    
    func getUser()
    {
        var urlRequest = URLRequest(url: URL(string: Endpoint.getUser)!)
        urlRequest.httpMethod = "get"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, httpRespnse, error) in
            if(data != nil && data?.count != 0)
            {
                let response = String(data: data!, encoding: .utf8)
                print(response!)
            }
        }.resume()
    }
}

let userObj = User(_httpUtility: HttpUtility())
userObj.registerUserWithEncodableProtocol()

