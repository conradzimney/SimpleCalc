//
//  main.swift
//  SimpleCalc
//
//  Created by Conrad Zimney on 10/7/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import Foundation

let prompt1 = "Enter an expression separated by returns:"
let prompt2 = "Enter a multi-operand expression separated by spaces, followed by 'count', 'avg', or 'fact'"

// Function for standard input reading
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

// Function for converting Strings to numbers
func convert(incoming:String) -> Int {
    let a:Int? = Int(incoming)
    return a!
    // return NSFormatter().numberFromString(incoming)!.integerValue   <-- I think this is for an older version of Swift
}

print("Would you like a simple calculator (1), or a multi-operand (2)?")
let userInput = convert(input())

if userInput == 1 {
    print(prompt1)
    let var1 = convert(input())
    let operation = input()
    let var2 = convert(input())
    switch operation {
    case "+", "add":
        print("Result: \(var1 + var2)")
    case "-", "sub":
        print("Result: \(var1 - var2)")
    case "*", "mul":
        print("Result: \(var1 * var2)")
    case "/", "div":
        print("Result: \(var1 / var2)")
    case "%", "mod":
        print("Result: \(var1 % var2)")
    default:
        print("Please enter a number followed by +, -, *, /, or %, followed by another number")
    }
} else {
    print(prompt2)
    let line = input()
    let inputArr = line.characters.split{$0 == " "}.map(String.init)
    var numArr = [Int](count: inputArr.count-1, repeatedValue: 0)
    for var i = 0; i < inputArr.count - 1; i++ {
        numArr[i] = convert(inputArr[i])
    }
    var function = inputArr[inputArr.count - 1]
    switch function {
        case "count":
            print("Count of inputs is \(numArr.count).")
        case "avg":
            var sum = 0
            for var i = 0; i < numArr.count; i++ {
                sum += numArr[i]
            }
            var avg = sum / numArr.count
            print("Average of inputs is \(avg).")
        case "fact":
            if numArr.count > 1 {
                print("Must enter only one number for a factorial calculation.")
            } else {
                let num = numArr[0]
                var fact = 1
                for var i = 1; i <= num; i++ {
                    fact *= i
                }
                print("Factorial of \(num) is \(fact).")
            }
        default:
            print("Please enter a series of numbers separated by spaces, followed by 'count', 'avg', or 'fact'")
    }
}




