//
//  main.swift
//  TestCourse1
//
//  Created by Константин Губаев on 25.03.2022.
//

import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

// Создаем свой тип коллекции «очередь» (queue) c использованием дженериков.

struct GenericQueue<T> {
    var names = [T]()
    
    mutating func push(name: T) {
        names.append(name)
    }
}

var stringName = GenericQueue(names: [ ])
stringName.push(name: "Johnny")
stringName.push(name: "Lisa")
stringName.push(name: "Fill")
stringName.push(name: "Bob")
stringName.push(name: "Kim")

print(stringName.names)

// Добавляем функцию высшего порядка

let names = stringName.names

let filterName = names.drop(while: {$0 as? String == "A"})

print(filterName)

// * Добавляем свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct FullName {
    let firstName = "Smith"
    let secondName = "Williams"
    let thirdName = "Jones"
    
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0:
                return firstName
            case 1:
                return secondName
            case 2:
                return thirdName
            case 3:
                return firstName + " " + secondName + " " + thirdName
            case 4:
                return nil
            }
        }
    }
}

let family = FullName()
print(family[3])
print(family[4])
print(family[5])


