using System;

namespace Task2
{
    class Animal
    {
        // Virtual method for dynamic binding
        public virtual void Speak()
        {
            Console.WriteLine("Animal makes a sound");
        }

        // Non-virtual method for static binding
        public void Eat()
        {
            Console.WriteLine("Animal is eating");
        }
    }

    // Derived class using override for dynamic binding
    class Dog : Animal
    {
        public override void Speak()
        {
            Console.WriteLine("Dog barks");
        }

        // Hiding the Eat() using 'new' for static binding
        public new void Eat()
        {
            Console.WriteLine("Dog is eating dog food");
        }
    }

    // Again, derived class using override for dynamic binding
    class Cat : Animal
    {
        public override void Speak()
        {
            Console.WriteLine("Cat meows");
        }

        // Hiding the Eat() using 'new' for static binding
        public new void Eat()
        {
            Console.WriteLine("Cat is eating cat food");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // Method calls that resolved at compile-time
            Console.WriteLine("=== Static Binding ===");
            Animal justAnimal = new Animal();
            Dog dogAnimal = new Dog();
            Cat catAnimal = new Cat();

            justAnimal.Eat();       // Animal.Eat()
            dogAnimal.Eat();        // Dog.Eat() ( hides Animal.Eat() )
            catAnimal.Eat();        // Cat.Eat() ( hides Animal.Eat() )

            Console.WriteLine();

            // Method calls that resolved at run-time
            Console.WriteLine("=== Dynamic Binding ===");
            Animal animalRef;

            animalRef = new Dog();
            animalRef.Speak();          // Dog.Speak()

            animalRef = new Cat();
            animalRef.Speak();          // Cat.Speak()

            animalRef = new Animal();
            animalRef.Speak();          // Animal.Speak()

            Console.WriteLine();

            // Demo 'new' with base class reference
            Console.WriteLine("=== Method Hiding with 'new' ===");
            Animal shyDoggo = new Dog();
            shyDoggo.Eat();     // Animal.Eat() because Eat is hidden, not overridden

            // use Dog reference for Dog.Eat() 
            Dog braveDoggo = new Dog();
            braveDoggo.Eat();   // Dog.Eat()

            Console.WriteLine();

            // Demo polymorphism
            Console.WriteLine("=== Polymorphism ===");
            printSpeak(new Animal());
            printSpeak(new Dog());
            printSpeak(new Cat());
        }

        // helper to demo Polymorphism 
        static void printSpeak(Animal animal)
        {
            animal.Speak();
        }
    }
}


// Reference for C#: 

// Inheritance - derive types to create more specialized behavior
// https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/object-oriented/inheritance

// Polymorphism
// https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/object-oriented/polymorphism