import Foundation

struct Employee
{
    func syncOfflineEmployeeRecords()
    {
        print("syncing offline records for employess started!")
        Thread.sleep(forTimeInterval: 2)
        print("syncing completed for employee")
    }
}

struct Department
{
    func syncOfflineDepartmentRecords()
    {
        print("syncing offline records for departments started!")
        Thread.sleep(forTimeInterval: 2)
        print("syncing completed for department")
    }
}
struct SyncManager
{
    func syncOfflineRecords()
    {
        // dependencies uisng dispatch queue
//        let serialQueue = DispatchQueue.init(label: "dependency example")
//        serialQueue.async {
//            let employee = Employee()
//            employee.syncOfflineEmployeeRecords()
//        }
//
//        serialQueue.async {
//            let department = Department()
//            department.syncOfflineDepartmentRecords()
//        }
        
        
        // dependencies using operation queue
        let employeeSyncOperation = BlockOperation()
        employeeSyncOperation.addExecutionBlock {
            let employee = Employee()
            employee.syncOfflineEmployeeRecords()
        }
        
        let departmentSyncOperation = BlockOperation()
        departmentSyncOperation.addExecutionBlock {
            let department = Department()
            department.syncOfflineDepartmentRecords()
        }
        
        departmentSyncOperation.addDependency(employeeSyncOperation)
        
        let operationQueue = OperationQueue()
        operationQueue.addOperation(employeeSyncOperation)
        operationQueue.addOperation(departmentSyncOperation)
    }
}

let obj = SyncManager()
obj.syncOfflineRecords()
