//
//  ContentView.swift
//  CoreDataTechProj
//
//  Created by Bagus Triyanto on 18/07/20.
//  Copyright © 2020 BagusIsGood. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                List (wizards, id: \.self) { wizard in
                    Text(wizard.name ?? "Unknown")
                }
                
                Spacer()
                
                Button("Add") {
                    let wizard = Wizard(context: self.moc)
                    wizard.name = "Bagus Triyanto"
                }
                
                Button("Save") {
                    if self.moc.hasChanges {
                        do {
                            try self.moc.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
                
            }
        .navigationBarTitle(Text("Core Data"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
#endif
