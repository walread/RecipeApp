//
//  ContentView.swift
//  Recipe List App
//
//  Created by Will Alread on 12/23/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .padding(.top, 40)
                    .font(.largeTitle)
                    .bold()
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(destination: RecipeDetailView(recipe: r),
                            label: {
                                
                                // MARK: Row item
                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(Font.custom("Avenir Heavy", size: 16))
                                        RecipeHighlightsView(highlights: r.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                            })
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
