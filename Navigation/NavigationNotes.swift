//
//  NavigationNotes.swift
//  Navigation
//
//  Created by Leo Chung on 1/4/24.
//

import SwiftUI

// Remember -> Swift will instantly create all navigation views even if they aren't clicked yet
// If you are creating a navigation stack with a lot of navigation links -> this will slow your program down
// You can prevent this by attaching a value to the NavigationLink -> it must conform to a protocol called Hashable
// Attaching a navigationDestination() modifier inside the navigation stack will tell the program what to do when it receives your data
// Most of Swift's built-in types conform to Hashable protocol (Int, String, Date, URL, arrays, dictionaries, etc.)
// If you have several different types of data to navigate through, just add several navigationDestion() modifiers (i.e., do this if you want to navigate an integer otherwise do this if you want to navigate a string)

// Hashing is a computer science term that is the process of converting some data into a smaller representation in a consistent way
// If you make a custom struct with properties that all conform to Hashable, then you can make the whole struct conform to Hashable with one change
struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

// Programmatic navigation allows you to move from one view to another just using code rather than waiting for the user to take a specific action
// This is done by binding the path of a NavigationStack to an array of whatever data you're navigating with ( NavigationStack(path: $path) )
// You can also bind paths using NavigationPath, which is able to hold a variety of data types in a single path
// NavigationPath is what is called a type-eraser -> it stores any kind of Hashable data without exposing exactly what type of data each item is

struct RandomView: View {
    @Binding var path: [Int]
    // @Binding var path: NavigationPath
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                    // path = NavigationPath()
                }
            }
    }
}

// If you're several views deep and want to return home:
// 1. If using a simple array for your path, you can call removeAll() on the path and remove everything to go back to the root view
// 2. If you are using NavigationPath, you can set it to a new, empty instance of NavigationPath like so: path = NavigationPath()
// To return home from the subview, you can do two options:
// 1. Store your path using an external class that uses an @Observable
// 2. Use a new property wrapper called @Binding

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct NavigationNotes: View {
    @State private var randomPath = [Int]()
//    @State private var path = NavigationPath()
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            RandomView(path: $path, number: 0)
                .navigationDestination(for: Int.self) { i in
                    RandomView(path: $path, number: i)
                }
        }

        
//        NavigationStack(path: $path) {
//            RandomView(number: 0)
//                .navigationDestination(for: Int.self) { i in
//                    RandomView(number: i)
//                }
//        }
        
//        NavigationStack(path: $path) {
//            List {
//                ForEach(0..<5) { i in
//                    NavigationLink("Select Number: \(i)", value: i)
//                }
//
//                ForEach(0..<5) { i in
//                    NavigationLink("Select String: \(i)", value: String(i))
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected the number \(selection)")
//            }
//            .navigationDestination(for: String.self) { selection in
//                Text("You selected the string \(selection)")
//            }
//            .toolbar {
//                Button("Push 556") {
//                    path.append(556)
//                }
//
//                Button("Push Hello") {
//                    path.append("Hello")
//                }
//            }
//        }
        
//        NavigationStack(path: $path) {
//            VStack {
//                Button("Show 32 then 64") {
//                    path = [32, 64]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }
        
//        NavigationStack {
//            List(0..<100) { i in
//                NavigationLink("Select \(i)", value: i)
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
//        }

    }
}

#Preview {
    NavigationNotes()
}
