import Foundation

struct Example
{
    func doWork()
    {
        let blockOperation = BlockOperation()
        
        blockOperation.addExecutionBlock {
            print("Hello")
        }
        
        blockOperation.addExecutionBlock {
            print("My name is")
        }
        
        blockOperation.addExecutionBlock {
            print("vishal modani")
        }
        
        // blockOperation.start()
        
        let anotherBlockOperation = BlockOperation()
        anotherBlockOperation.addExecutionBlock{
            print("MAIT")
        }
        
        let operationQueue = OperationQueue()
        operationQueue.qualityOfService = .utility
        operationQueue.addOperation(blockOperation)
        operationQueue.addOperation(anotherBlockOperation)
        
     }
}

let obj = Example()
obj.doWork()
