import UIKit

var greeting = "Hello, playground"

var pepita = Bird(initialEnergy: 0)

pepita.eat(grams: 10)

class Bird {
    var energy:Int

    init(initialEnergy:Int) {
        self.energy = initialEnergy
    }
    func eat(grams:Int) {
        self.energy += grams * 4
    }
}

pepita.energy
