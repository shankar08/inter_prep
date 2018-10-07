import UIKit

//this is my mergesort recursive

public func mergeSort(inputArray: [Int]) -> [Int] {
    
    guard inputArray.count > 1 else {
        return inputArray
    
    }

    let midIndex = inputArray.count/2
    
    let leftArray = mergeSort(inputArray: Array(inputArray[0..<midIndex]))
    let rightArray = mergeSort(inputArray: Array(inputArray[midIndex..<inputArray.count]))
    
    return merge(leftpile:leftArray, rightpile:rightArray)
    
    
}


public func merge(leftpile:[Int], rightpile:[Int]) -> [Int] {
    
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray = [Int]()
    
    while leftIndex < leftpile.count && rightIndex < rightpile.count{
        
        if leftpile[leftIndex] < rightpile[rightIndex]{
            orderedArray.append(leftpile[leftIndex])
            leftIndex += 1
        }else if leftpile[leftIndex] > rightpile[rightIndex]{
            orderedArray.append(rightpile[rightIndex])
            rightIndex += 1
        }else {
            orderedArray.append(leftpile[leftIndex])
            leftIndex += 1
            orderedArray.append(rightpile[rightIndex])
            rightIndex += 1
        }
        
        
    }
    
    while leftIndex < leftpile.count{
        orderedArray.append(leftpile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightpile.count {
        orderedArray.append(rightpile[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}


//main func
let inputArray = [1,3,12,11,25,8,1,1]

let anotherAray = [55,2,-1,11,21,5,2,-6,17,0,4]
mergeSort(inputArray: anotherAray)
