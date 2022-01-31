import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// API
// What are API/REST API/WebService
// Why are they used in mobile applications
// How to get data from API using Swift

func getData(){
    let session = URLSession.shared
    let serviceUrl = URL(string: "https://jsonplaceholder.typicode.com/todos/1")

    let task = session.dataTask(with:serviceUrl!) { (serviceData, serviceResponse, error) in

        if error == nil{
            let httpResponse = serviceResponse as! HTTPURLResponse
            if(httpResponse.statusCode == 200){
                // data parse

                let jsonData = try? JSONSerialization.jsonObject(with: serviceData!, options: .mutableContainers)

                let result = jsonData as! Dictionary<String, Any>
                print(result)
            }
        }
    }
    task.resume()
}

getData()
 
