//
//  CatalogView.swift
//  Calories
//
//  Created by Milana Antonova on 23.05.22.
//

import SwiftUI


struct CatalogView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
    var catalogFood: [CatalogFood] = CatalogFoodList.catalogFoodList
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    HStack{
                        Text("Catalog of Food")
                            .bold()
                            .padding(.leading)
                            .font(.system(size: 39))
                            .padding(.top, -50)
                        Spacer()
                    }
                    HStack{
                        Text("(per 100 grams of product)")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 15))
                            .padding([.leading, .bottom])
                        Spacer()
                    }
                    
                    
                    List(catalogFood, id: \.id) { catalogFoodItem in
                        HStack {
                            Text(catalogFoodItem.name)
                                .font(.system(size: 20))
                                .bold()
                                .padding()
                            
                            Text("\(Int(catalogFoodItem.calories)) Kcal")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .onTapGesture {
                            DataController().addFood(name: catalogFoodItem.name, calories: catalogFoodItem.calories, context: managedObjContext)
                            dismiss()
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
