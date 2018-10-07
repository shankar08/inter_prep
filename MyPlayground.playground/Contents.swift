//: Playground - noun: a place where people can play

import UIKit

//*** Queue with array.

public struct Queue<T> {
    
    fileprivate var array = [T]()

    public var isEmpty:Bool {
        return array.isEmpty
        
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T){
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
    
    
    public var last: T? {
        return array.last
    }
}

var queue = Queue<String>()

queue.enqueue("Shankar")
queue.enqueue("Nabina")
queue.enqueue("Prajapati")
queue.enqueue("Bade")

print("\(queue)")

queue.dequeue()

print("\(queue)")

queue.front
queue.last


//** Stack

public struct Stack<T> {
    
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
    
}


var myStack = Stack<String>()

myStack.push("Shankar")
myStack.push("Bade")
myStack.push("Prajapati")
myStack.push("Nabina")

print("\(myStack)")
myStack.pop()

print("\(myStack)")


// ******  Linked list

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public func append(value: T ){
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        }else {
            head = newNode
        }
    }
}

let list = LinkedList<String>()

print(list.isEmpty)
//print(list.first)
list.append(value: "Shankar")

print(list.isEmpty)



//**** minimum distance between two numbers in an array with n^2 efficiency


public func minDist(inputArray: [Int], a: Int, b: Int) -> Int32{
    
    var minDistance = INT_MAX
    
    for itemA in 0..<inputArray.count {
        for itemB in 1..<inputArray.count{
            
            if ((a == inputArray[itemA] && b == inputArray[itemB] || b == inputArray[itemA] && a == inputArray[itemA])) {
                if minDistance > abs(itemB - itemA){
                    minDistance = Int32(abs(itemA - itemB))
                }
                
            }
            
        }
    }
  
    
    return minDistance
    
    
}
//**** minimum distance between two numbers in an array with n efficiency

public func minDist2(inputArray: [Int], a: Int, b: Int) -> Int32{
    
    var min_dist = INT_MAX
    var prev: Int = 0
    
    for index in 0..<inputArray.count {
        if inputArray[index] == a || inputArray[index] == b {
            prev = index
            break
        }
    }
    
    for secondIndex in prev..<inputArray.count{
        
        if inputArray[secondIndex] == a || inputArray[secondIndex] == b
        {
            if inputArray[prev] != inputArray[secondIndex] && (secondIndex - prev) < min_dist {
                min_dist = Int32(secondIndex - prev)
                prev = secondIndex
            }else {
                prev = secondIndex
            }
        }
        
    }
    return min_dist
}



var myArray = [1,2,3,4,5,2,0,0,0,4,6,1,2,6]

//print(minDist(inputArray: myArray, a: 1, b: 4))

//print(minDist2(inputArray: myArray, a: 4, b: 1))


//** leaders in an arraya with n^2

public func printLeaders(inputArray: [Int]) {
    
    for indexA in 0..<inputArray.count {

        //var temp : Int?
        for indexB in (indexA+1)..<inputArray.count {
            
            if inputArray[indexA] <= inputArray[indexB]{
                break
            }
          // temp = indexB
            if indexB == inputArray.count-1 {
                print(inputArray[indexA])
            }
        }
      
      
    }
    print(inputArray.last!)
}


var myArray2 = [7,1,8,5]

//printLeaders(inputArray: myArray2)

public func printLeaders2(inputArray: [Int]) {
    
   
    var highestNumber : Int = inputArray[inputArray.count-1]
    
    print(highestNumber)
    for index in (0..<inputArray.count).reversed() {
        
        if inputArray[index] > highestNumber {
            highestNumber = inputArray[index]
            print(highestNumber)
        }
    }
    
}

printLeaders2(inputArray: myArray2)





