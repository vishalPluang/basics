import UIKit


func addTwoNumbers(number1: Int, number2: Int) -> Int{
    return number1 + number2
}

var addTwoNumbers:(Int, Int) -> Int =
{
    (number1, number2) in
    let result = number1 + number2
    return result
}

print(addTwoNumbers(10 ,12))

var index = 100

switch index {
   case 100 :
      print("Value of index is 100")
   case 10,15 :
      print( "Value of index is either 10 or 15")
   case 5 :
      print( "Value of index is 5")
   default :
      print( "default case")
}

index = 120
if index >= 0 && index < 100 {
    print("hi vishal!")
}

var first = "vishal"
var last = "Modani"
var number = "9717207927"

let fullName = "My name is \(first) \(last) and you can contact me on this number: \(number)"
print(fullName)


