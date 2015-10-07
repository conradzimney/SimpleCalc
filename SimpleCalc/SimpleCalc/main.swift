//
//  main.swift
//  SimpleCalc
//
//  Created by Conrad Zimney on 10/7/15.
//  Copyright © 2015 Conrad Zimney. All rights reserved.
//

import Foundation

let prompt = "Enter an expression separated by returns:"

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
    // return NSFormatter().numberFromString(incoming)!.integerValue
}

print(prompt)
let var1 = convert(input())
let operation = input()
let var2 = convert(input())

switch operation {
    case "+":
        print("Result: \(var1 + var2)")
    case "-":
        print("Result: \(var1 - var2)")
    case "*":
        print("Result: \(var1 * var2)")
    case "/":
        print("Result: \(var1 / var2)")
    case "%":
        print("Result: \(var1 % var2)")
    default:
        print("Please enter a number followed by +, -, *, /, or %, followed by another number")
}



