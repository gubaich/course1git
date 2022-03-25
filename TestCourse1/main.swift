import Foundation

//Тask 1. Решить квадратное уравнение
func solveTheQuadraticEquation(a: Double, b: Double, c: Double) -> (Double?, Double?) {
    let discriminant = pow(b, 2) - 4 * a * c
    
    if discriminant > 0 {
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        return (x1, x2)
    } else if discriminant == 0 {
        let x = -b / (2 * a)
        return (x, nil)
    }
    return (nil, nil)
}
let quadraticEquationDecision = solveTheQuadraticEquation(a: 1, b: -5, c: 6)
if let root1 = quadraticEquationDecision.0, let root2 = quadraticEquationDecision.1 {
    print("Два корня:", root1, root2)
} else if let root = quadraticEquationDecision.0 {
    print("Один корень", root)
} else {
    print("Корней нет")
}

//Task 2. Даны катеты прямоугольного треугольника. Найдем площадь, периметр и гипотенузу треугольника.
var cat1: Double = 16
var cat2: Double = 4
var S = cat1 * cat2 / 2
print("Площадь прямоугольного треугольника равн \(S)")
var C = sqrt(pow(cat1, 2)) + pow(cat2, 2)
print("Гипотенуза прямоугольного треугольника равна \(C)")
var P = cat1 + cat2 + C
print("Периметр прямоугольного треугольника равен \(P)")

//Task 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var deposit: Float = 1000
var percent: Float = 15
percent = percent / 100
var result1 = deposit + deposit * percent
var result2 = result1 + result1 * percent
var result3 = result2 + result2 * percent
var result4 = result3 + result3 * percent
var result5 = result4 + result4 * percent
var counter = 1
var time = [result1, result2, result3, result4, result5]
for i in time{
    print("Через \(counter) год/лет сумма вклада будет равна \(i)")
    counter += 1
}



