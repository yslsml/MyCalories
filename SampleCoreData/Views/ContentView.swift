//
//  ContentView.swift
//  Calories
//
//  Created by Milana Antonova on 23.05.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
   @Environment(\.managedObjectContext) var managedObjContext
   @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
   
   @State private var showingAddView = false
   @State private var showingCatalogView = false
   
   var body: some View {
       NavigationView {
           VStack(alignment: .leading) {
               Text("\(Int(totalCaloriesToday())) KCal (today)")
                   .foregroundColor(.gray)
                   .padding([.horizontal])
                   .padding([.bottom], 5)
               Text("\(Int(totalCaloriesYesterday())) KCal (yesteday)")
                   .foregroundColor(.gray)
                   .padding([.horizontal])
               List {
                   ForEach(food) { food in
                       NavigationLink(destination: EditFoodView(food: food)) {
                           HStack {
                               VStack(alignment: .leading, spacing: 6) {
                                   Text(food.name!)
                                       .bold()
       
                                   Text("\(Int(food.calories))") + Text(" calories").foregroundColor(.red)
                               }
                               Spacer()
                               Text(calcTimeSince(date: food.date!))
                                   .foregroundColor(.gray)
                                   .italic()
                           }
                       }
                   }
                   .onDelete(perform: deleteFood)
               }
               .listStyle(.plain)
           }
           .navigationTitle("Calories App")
           .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button {
                       showingCatalogView.toggle()
                   } label: {
                       Label("Catalog of food", systemImage: "character.book.closed")
                   }
               }
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button {
                       showingAddView.toggle()
                   } label: {
                       Label("Add food", systemImage: "plus.circle")
                   }
               }
               ToolbarItem(placement: .navigationBarLeading) {
                   EditButton()
               }
           }
           .sheet(isPresented: $showingAddView) {
               AddFoodView()
           }
           .sheet(isPresented: $showingCatalogView) {
               CatalogView()
           }
       }
       .navigationViewStyle(.stack)
   }
   

   private func deleteFood(offsets: IndexSet) {
       withAnimation {
           offsets.map { food[$0] }
           .forEach(managedObjContext.delete)
           
           
           DataController().save(context: managedObjContext)
       }
   }
   
   
   private func totalCaloriesToday() -> Double {
       var caloriesToday : Double = 0
       for item in food {
           if Calendar.current.isDateInToday(item.date!) {
               caloriesToday += item.calories
           }
       }
       //print("Calories today: \(caloriesToday)")
       return caloriesToday
   }
    
    private func totalCaloriesYesterday() -> Double {
        var caloriesYesterday : Double = 0
        for item in food {
            if Calendar.current.isDateInYesterday(item.date!) {
                caloriesYesterday += item.calories
            }
        }
        //print("Calories yesterday: \(caloriesYesterday)")
        return caloriesYesterday
    }
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
       ContentView()
   }
}
