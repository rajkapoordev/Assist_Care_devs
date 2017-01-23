//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var headerTitle = NSMutableArray()
var isArrExpand = NSMutableArray()
headerTitle.add("Persal Info")
headerTitle.add("Academic")
headerTitle.add("Interested Area")
let arrayExpand1 = headerTitle.map({_ in false})
let arrayExpand = headerTitle.map({ value in
    return false
})
print(arrayExpand)
