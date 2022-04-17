//
//  main.swift
//  TestCourse1
//
//  Created by Константин Губаев on 25.03.2022.
//

import Foundation

//Lesson 5. Home Work
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

//MARK: -Enums

enum CarWindowState: String {
    case open = "открыты"
    case close = "закрыты"
}
enum EngineStart: String {
    case on = "запущен"
    case off = "заглушен"
}
enum CarHatchState: String {
    case open = "открыт"
    case close = "закрыт"
}
enum Trailer: String {
    case loaded = "загружен"
    case unloaded = "разгружен"
}

//MARK: -protocols and extension

protocol CarProtocol: AnyObject {
    var brand: String { get }
    var year: Int { get }
    var km: Double { get set}
    var engineStart: EngineStart { get set }
    var windowState: CarWindowState { get set }
    
    func engineStatus(state: EngineStart)
    func windowStatus(state: CarWindowState)
}

extension CarProtocol {
    func engineStatus(state: EngineStart) {
        engineStart = state
    }
    
    func windowStatus(state: CarWindowState) {
        windowState = state
    }
}

//MARK: -classes

final class SportCar: CarProtocol {
    var brand: String
    var year: Int
    var km: Double
    var filledBodyVolume: Double
    var engineStart: EngineStart
    var windowState: CarWindowState
    var carHatchState: CarHatchState
    
    init(brand: String, year: Int, km: Double, filledBodyVolume: Double, engineStart: EngineStart, windowState: CarWindowState, carHatchState: CarHatchState) {
        self.brand = brand
        self.year = year
        self.km = km
        self.filledBodyVolume = filledBodyVolume
        self.engineStart = engineStart
        self.windowState = windowState
        self.carHatchState = carHatchState
    }
    
    func carHatchStatus(state: CarHatchState) {
        carHatchState = state
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Марка автомобиля: \(brand), год выпуска: \(year), пробег: \(km), багажник заполнен на: \(filledBodyVolume)  состояние двигателя: \(engineStart.rawValue), состояние окон: \(windowState.rawValue), люк: \(carHatchState.rawValue)"
    }
}

final class TrunkCar: CarProtocol {
    var brand: String
    var year: Int
    var km: Double
    var trailer: Trailer
    var filledTrunkVolume: Double
    var engineStart: EngineStart
    var windowState: CarWindowState
    
    init(brand: String, year: Int, km: Double, filledTrunkVolume: Double, engineStart: EngineStart, windowState: CarWindowState, trailer: Trailer) {
        self.brand = brand
        self.year = year
        self.km = km
        self.filledTrunkVolume = filledTrunkVolume
        self.engineStart = engineStart
        self.windowState = windowState
        self.trailer = trailer
    }
    
    func trailerStatus(state: Trailer) {
        trailer = state
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Марка автомобиля: \(brand), год выпуска: \(year), пробег: \(km),кузов заполнен на: \(filledTrunkVolume) состояние двигателя: \(engineStart.rawValue), состояние окон: \(windowState.rawValue), прицеп: \(trailer.rawValue)"
    }
}

//MARK: -Экземпляры классов

var car1 = SportCar (brand: "Mazda", year: 2020, km: 100.00, filledBodyVolume: 50, engineStart: .off, windowState: .close, carHatchState: .close)

var car2 = SportCar (brand: "BMW", year: 2020, km: 10.00, filledBodyVolume: 0, engineStart: .on, windowState: .open, carHatchState: .open)

var car3 = TrunkCar (brand: "Kamaz", year: 2020, km: 500, filledTrunkVolume: 500, engineStart: .off, windowState: .close, trailer: .loaded)

var car4 = TrunkCar (brand: "Mersedes", year: 2010, km: 1000, filledTrunkVolume: 1000, engineStart: .on, windowState: .open, trailer: .unloaded)

car3.trailerStatus(state: .unloaded)
car1.carHatchStatus(state: .open)
car2.windowStatus(state: .close)
car4.engineStatus(state: .off)

func lineBreakPrint (_ value: Any) {
    print(value, "\n")
}

lineBreakPrint(car1)
lineBreakPrint(car2)
lineBreakPrint(car3)
lineBreakPrint(car4)


