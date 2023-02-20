import Cocoa

class Animal{
    let legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal{
    init(){
        super.init(legs: 4)
    }
    
    func speak(){
        print("BARK <General>")
    }
}

class Corgi: Dog{
    override func speak() {
        print("BJORK <CORGI>")
    }
}

class Poodle: Dog{
    override func speak() {
        print("BOUJEE BARK <POODLE>")
    }
}

let genDog = Dog()
let corgi = Corgi()
let poodle = Poodle()

genDog.speak()
corgi.speak()
poodle.speak()

class Cat: Animal{
    let isTame: Bool
    
    init(isTame: Bool){
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak(){
        print("Meow <GENERAL>")
    }
}

class Persian: Cat{
    override func speak() {
        print("Fancy Meow <PERSIAN>")
    }
}

class Lion: Cat{
    override func speak(){
        print("ROAR <LION>")
    }
}

let genCat = Cat(isTame: true)
let persianCat = Persian(isTame: true)
let lion = Lion(isTame: false)

genCat.speak()
persianCat.speak()
lion.speak()
