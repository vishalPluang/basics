import Foundation

// syntax of dispatch group
let dispatchGroup = DispatchGroup()

// i am going to start a task
dispatchGroup.enter()

// perform tasks for API - 1 - api or database calls or other haevy operations

// all tasks are completed
dispatchGroup.leave()

// i am going to start a task
dispatchGroup.enter()

// perform tasks for API - 2 - api or database calls or other haevy operations

// all tasks are completed
dispatchGroup.leave()

