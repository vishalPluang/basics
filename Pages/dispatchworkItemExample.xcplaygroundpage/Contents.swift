import Foundation
import UIKit

struct Example
{
    func printNumbers()
    {
        var workItem: DispatchWorkItem?
        workItem = DispatchWorkItem
        {
            for i in 1..<10
            {
                guard let wkItem = workItem, !wkItem.isCancelled
                else {
                    print("work item is cancelled")
                    break
                }
                print("\(i)")
                sleep(1)
            }
        }
        
        workItem?.notify(queue: .main, execute: {
            print("done printing numbers!")
        })
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem!)
        
        queue.asyncAfter(deadline: .now() + .seconds(3))
        {
            workItem?.cancel()
        }
        
    }
    
    func myDispatchworkItemExample()
    {
        var number: Int = 15
        let workItem = DispatchWorkItem
        {
            number += 5
        }
        
        workItem.notify(queue: .main)
        {
            print("Increment number completed new value  = \(number)!")
        }
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem)
        
        
    }
}

let obj = Example()
obj.printNumbers()
