//
//  NavigationBars.swift
//  Navigation
//
//  Created by Leo Chung on 1/5/24.
//

import SwiftUI

// You can stack toolbar buttons using the same placement by either repeating ToolbarItem or using ToolbarItemGroup
//.toolbar {
//    ToolbarItemGroup(placement: .topBarLeading) {
//        Button("Tap Me") {
//            // button action here
//        }
//
//        Button("Tap Me 2") {
//            // button action here
//        }
//    }
//}

// You can also allow for the navigation bar to be renamed -> if you're using the .inline title display mode, you can also pass a binding to navigationTitle() which will allow you to rename the title
struct NavigationBars: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Or Tap Me") {
                            // new button action here
                        }
                    }
                    
                }
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        // Placements include:
            // .confirmationAction -> when you want users to agree to something, such as agreeing to terms of service
            // .destructiveAction -> when users need to make a choice to destroy whatever it is they are working with -> a confirmation to remove data will be created
            // .cancellationAction -> When users need to back out of changes such as discarding changes
            // .navigation -> Used for buttons that make the user go between data (web browser back and forward)
            // Note: These semantic placements will have extra iOS styling and information -> it will also appear in the correct place on iOS, macOS, watchOS, and more
        // If you need the user to decide between saving a change or discarding it, you might want to add navigationBarBackButtonHidden() modifier so they can't tape Back to exit without making a choice
            
        
//        NavigationStack {
//            List(0..<100) { i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue)
//            .toolbarColorScheme(.dark, for: .navigationBar)
            // Note: the bottom two toolbar modifiers affect ALL bars -> you can force it to only modify the navigation bar by adding for: .navigationBar as a second paramter to both toolbar
            // You can also add the toolbar() modifier set to .hidden, either for all bars or just the navigation bar
        }
    }
}

#Preview {
    NavigationBars()
}
