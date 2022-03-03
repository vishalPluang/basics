import Foundation

struct Order
{
    let amount: Double
    let description: String
    let tax: Double
    let created_By: String
}

protocol OrderStorage
{
    func saveOrder(order: Order)
}

class Handler
{
    private let storage: OrderStorage
    
    init(database: OrderStorage)
    {
        storage = database
    }
    
    func saveOrder(order: Order)
    {
        guard order.amount != 0 else {
            print("save operation failed. order amount shoubld be greater than zero")
            return
        }
        
        storage.saveOrder(order: order)
    }
}

class OrderDatabaseOperation: OrderStorage
{
    func saveOrder(order: Order)
    {
        // save in database
        print("order is created by \(order.created_By) of money \(order.amount)")
    }
}

class OrderAPIOperation: OrderStorage
{
    func saveOrder(order: Order) {
        // save through API
        print("order is created by \(order.created_By) of money \(order.amount)")
    }
    
    
}

let objHandler1 = Handler(database: OrderDatabaseOperation())
objHandler1.saveOrder(order: Order(amount: 10000, description: "tshirt", tax: 0, created_By: "Vishal modani"))

let objHandler2 = Handler(database: OrderAPIOperation())
objHandler2.saveOrder(order: Order(amount: 20000, description: "tshirt", tax: 0, created_By: "Vishal modani"))
