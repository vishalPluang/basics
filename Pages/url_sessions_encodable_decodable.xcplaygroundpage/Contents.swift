import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true;

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
    func registerUserWithEncodableProtocol()
    {
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        
        let request = UserRegistrationRequest(name: "vishal", email: "vishal@gmail.com", password: "12345")
        do
        {
            let requestBody = try JSONEncoder().encode(request)
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
                do
                {
                    let response = try JSONDecoder().decode(UserRegistrationResponse.self, from: data!)
                    print(response.data.name)
                }
                catch let error
                {
                    print("decoding error \(error.localizedDescription)")
                }
            }
        }.resume()
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

let userObj = User()
userObj.registerUserWithEncodableProtocol()


