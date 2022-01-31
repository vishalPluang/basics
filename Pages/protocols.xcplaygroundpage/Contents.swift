import UIKit

protocol CarDesign
{
    func startEngine()
    func stopEngine()
    func increaseSpeed()
    func decreaseSpeed()
}

struct Audi : CarDesign
{
    func startEngine() {
        print("Audi car Engine is started!")
    }
    
    func stopEngine() {
        print("Audi car Engine is stopped!")
    }
    
    func increaseSpeed() {
        print("Audi car Engine is speed is increased!")
    }
    
    func decreaseSpeed() {
        print("Audi car engine speed is decreased!")
    }
}

struct BMW: CarDesign
{
    func startEngine() {
        print("BMW car Engine is started!")
    }
    
    func stopEngine() {
        print("BMW car Engine is stopped!")
    }
    
    func increaseSpeed() {
        print("BMW car Engine is speed is increased!")
    }
    
    func decreaseSpeed() {
        print("BMW car engine speed is decreased!")
    }
}

let bmwCar = BMW()
bmwCar.startEngine()
bmwCar.stopEngine()
let audiCar = Audi()
audiCar.increaseSpeed()
