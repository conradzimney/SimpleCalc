//
//  main.swift
//  SimpleCalc
//
//  Created by Conrad Zimney on 10/7/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import Foundation

// Function for standard input reading
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

// Function for converting Strings to numbers
func convert(incoming:String) -> Int {
    //let a:Int? = Int(incoming)
    //return a!
    return NSNumberFormatter().numberFromString(incoming)!.integerValue   // <-- I think this is for an older version of Swift
}

let prompt = "Enter an expression separated by returns, or a single-line multi-operand expression separated by spaces:"
var keepGoing = true;

repeat {
    print(prompt)
    let line = input()
    let inputArr = line.characters.split{$0 == " "}.map(String.init)
    
    if inputArr.count == 1 {                    // Simple 3 line case
        let var1 = convert(inputArr[0])
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
    } else {                                    // Multi-operand single line case
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
                var avg = Float(sum) / Float(numArr.count)
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
    print("Would you like to calculate again? 'y' for yes, 'n' for no")
    var response = input()
    if response == "y" {
        keepGoing = true;
    } else if response == "n" {
        keepGoing = false;
        print("Thanks for calculating.")
    } else {
        print("Please enter 'y' to continue. Program will now terminate.")
    }
} while keepGoing


