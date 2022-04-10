//
//  main.swift
//  TestCourse1
//
//  Created by Константин Губаев on 25.03.2022.
//

import Foundation



//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.


enum CarWindowState: String {
    case open = "открыты"
    case close = "закрыты"
}
enum EngineStart: String {
    case on = "запущен"
    case off = "заглушен"
}

//MARK: -Описываем родительский класс с общими свойствами.

class Car {
    let brand: String
    let year: Int
    var engineStart: EngineStart
    var windowState: CarWindowState
    
    func engineStatus(state: EngineStart) {}
    
    func windowStatus(state: CarWindowState) {}
    
    init (brand: String, year: Int, engineStart: EngineStart, windowState: CarWindowState) {
        self.brand = brand
        self.year = year
        self.engineStart = engineStart
        self.windowState = windowState
    }
}

//MARK: -Перечисление о работе люка для SportCar
enum CarHatchState: String {
    case open = "открыт"
    case close = "закрыт"
}

//MARK: -Описываем дочерний класс SportCar от Car с отличительными свойствами и методами.
final class SportCar: Car {
    var filledBodyVolume: Double
    var carHatchState: CarHatchState
    
    func carHatchStatus(state: CarHatchState) {
        carHatchState = state
    }
    
    override func engineStatus(state: EngineStart) {
        engineStart = state
    }
    
    override func windowStatus(state: CarWindowState) {
        windowState = state
    }
    
    func printPropetiesSportCar(car: SportCar) {
        print("""
        Марка спортивного авто: \(car.brand)
        Год выпуска: \(car.year)
        Двигатель: \(car.engineStart.rawValue)
        Окна: \(car.windowState.rawValue)
        Багажник заполнен на: \(car.filledBodyVolume) л
        Состояние люка: \(car.carHatchState.rawValue)
        ---------------------------------------------
        """)
    }
    
    init(brand: String, year: Int, engineStart: EngineStart, windowState: CarWindowState, filledBodyVolume: Double, carHatchState: CarHatchState) {
        self.filledBodyVolume = filledBodyVolume
        self.carHatchState = carHatchState
        super.init(brand: brand, year: year, engineStart: engineStart, windowState: windowState)
    }
}

//MARK: -Создаем экземпляр класса SportCar
    var sportCarAudi = SportCar(brand: "Audi", year: 2021, engineStart: .off, windowState: .open, filledBodyVolume: 100, carHatchState: .open)

sportCarAudi.windowStatus(state: .open)
sportCarAudi.filledBodyVolume = 50.6
sportCarAudi.engineStatus(state: .off)
sportCarAudi.carHatchStatus(state: .close)
sportCarAudi.printPropetiesSportCar(car: sportCarAudi)

//MARK: -Перечисление о работе Mp3 для TrunkCar
enum Mp3State: String {
    case on = "включен"
    case off = "выключен"
}
    
//MARK: -Описываем дочерний класс TrunkCar от Car с отличительными свойствами и методами.

final class TrunkCar: Car {
    var filledTrunkVolume: Double
    var mp3: Mp3State

    func mp3Status(state: Mp3State) {
        mp3 = state
    }
    
    override func engineStatus(state: EngineStart) {
        engineStart = state
    }

    override func windowStatus(state: CarWindowState) {
        windowState = state
    }

    func printPropeties(car: TrunkCar) {
        print("""
        Марка грузового авто: \(car.brand)
        Год выпуска: \(car.year)
        Двигатель: \(car.engineStart.rawValue)
        Окна: \(car.windowState.rawValue)
        Кузов заполнен на: \(car.filledTrunkVolume) л
        Mp3 плеер: \(car.mp3.rawValue)
        """)
    }
    
    init(brand: String, year: Int, engineStart: EngineStart, windowState: CarWindowState, filledTrunkVolume: Double, mp3: Mp3State) {
        self.filledTrunkVolume = filledTrunkVolume
        self.mp3 = mp3
        super.init(brand: brand, year: year, engineStart: engineStart, windowState: windowState)
    }
}

//MARK: -Создаем экземпляр класса TrunkCar
var trunkCarBMW = TrunkCar(brand: "BMW", year: 2020, engineStart: .off, windowState: .close, filledTrunkVolume: 10.10, mp3: .off)

trunkCarBMW.windowStatus(state: .open)
trunkCarBMW.engineStatus(state: .on)
trunkCarBMW.filledTrunkVolume = 600.00
trunkCarBMW.mp3Status(state: .on)
trunkCarBMW.printPropeties(car: trunkCarBMW)
