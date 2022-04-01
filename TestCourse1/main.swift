//
//  main.swift
//  TestCourse1
//
//  Created by Константин Губаев on 25.03.2022.
//

import Foundation

//Lesson 2. Home Work
//Task 1. Написать функцию,которая опредляет,четное число или нет.
func evenNumbers(number: Int) -> Bool {
    return number % 2 == 0
}

//Task 2.Написать функцию,которая опредляет, делится ли число без остатка на 3.
func someNumber(number: Int, divider: Int) -> Bool {
    return number % divider == 0
}

//Task 3. Создать возрастающий массив из 100 чисел.
var increasingArrays = [Int]()
for count in 1...100 {
    increasingArrays.append(count)
}

//Task 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for count in increasingArrays {
    if evenNumbers(number: count) || !someNumber(number: count, divider: 3) {
        if let index = increasingArrays.firstIndex(of: count) {
            increasingArrays.remove(at: index)
        }
    }
}
print("Задание 4\n")
print(increasingArrays)

