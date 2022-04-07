//
//  main.swift
//  TestCourse1
//
//  Created by Константин Губаев on 25.03.2022.
//

import Foundation

print("Hello, World!")

//Lesson 3. Home Work
//Task 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//Task 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//Task 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//Task 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//Task 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//Task 6. Вывести значения свойств экземпляров в консоль.

enum CarWindowState: String {
    case open = "открыты"
    case close = "закрыты"
}
enum EngineStart: String {
    case on = "запущен"
    case off = "заглушен"
}


struct SportCar {
    let brand: String
    let year: Int
    var bodyVolume: Double
    var engineStart: EngineStart
    var windowState: CarWindowState
    var filledBodyVolume: Double
    
    mutating func engineStatus(state: EngineStart) {
        engineStart = state
    }
    
    mutating func windowStatus(state: CarWindowState) {
        windowState = state
    }
    
    func printPropeties(car: SportCar) {
        print("""
        Марка авто: \(car.brand)
        Год выпуска: \(car.year)
        Объем багажника: \(car.bodyVolume) л
        Двигатель: \(car.engineStart.rawValue)
        Окна: \(car.windowState.rawValue)
        Багажник заполнен на: \(car.filledBodyVolume) л
        """)
    }
}
var sportCarAudi = SportCar(brand: "Audi", year: 2021, bodyVolume: 100.0, engineStart: .off, windowState: .open, filledBodyVolume: 0)

sportCarAudi.windowStatus(state: .open)
sportCarAudi.filledBodyVolume = 50.6
sportCarAudi.engineStatus(state: .off)
sportCarAudi.printPropeties(car: sportCarAudi)

struct TrunkCar {
    let brand: String
    let year: Int
    var trunkVolume: Double
    var engineStart: EngineStart
    var windowState: CarWindowState
    var filledTrunkVolume: Double
    
    mutating func engineStatus(state: EngineStart) {
        engineStart = state
    }
    
    mutating func windowStatus(state: CarWindowState) {
        windowState = state
    }
    
    func printPropeties(car: TrunkCar) {
        print("""
        -------------------------------
        Марка авто: \(car.brand)
        Год выпуска: \(car.year)
        Объем кузова: \(car.trunkVolume) л
        Двигатель: \(car.engineStart.rawValue)
        Окна: \(car.windowState.rawValue)
        Кузов заполнен на: \(car.filledTrunkVolume) л
        """)
    }
}

var trunkCarBMW = TrunkCar(brand: "BMW", year: 2020, trunkVolume: 700.0, engineStart: .on, windowState: .open, filledTrunkVolume: 0.0)

trunkCarBMW.windowStatus(state: .close)
trunkCarBMW.engineStatus(state: .on)
trunkCarBMW.filledTrunkVolume = 600.00
trunkCarBMW.printPropeties(car: trunkCarBMW)
