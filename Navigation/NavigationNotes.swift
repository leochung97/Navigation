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
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
        
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
