//
//  Game2.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//

import SwiftUI

struct Game2: View {
    
    var myGameDrag : Game
    
    @State private var rotationPlanet = false
    @StateObject var gridData = GridViewModel()
    let rows = Array(repeating: GridItem(.flexible(), spacing: 10), count: 1)
    
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .padding()
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .frame(height: 390, alignment: .center)
                VStack {
                    Image(myGameDrag.gameImg)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                    Text(myGameDrag.gameDescription)
                        .font(.custom("SFUIDisplay-Light", size: 18))
                        .foregroundColor(Color("bleuNuit"))
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            
            VStack{
                LazyHGrid(rows:rows,spacing: 20, content: {
                    ForEach(gridData.gridItems){ grid in
                        ZStack {
                            Color.white
                                .opacity(0.8)
                            Text(grid.gridText)
                                .foregroundColor(Color("rouge"))
                        }.frame( width: 90,height: 90)
                        .cornerRadius(50)
                        .onDrag({
                                    gridData.currentGrid = grid
                                    return NSItemProvider(object: String(grid.gridText) as NSString)})
                        .onDrop(of:[.text], delegate: DropViewDelegate(grid: grid,gridData: gridData))
                    }
                }).frame(width: 90, height: 90, alignment: .center)
            }
        }
    }
}

struct Game2_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gamePlanet: PLANET2, gameTitle: "La masse volumique pour... Créer des Cocktails pour tes potes")
            Game2(myGameDrag: GAME1)
        }
    }
}

struct Grid: Identifiable {
    var id = UUID().uuidString
    var gridText: String
}
class GridViewModel: ObservableObject {
    @Published var gridItems =
        [Grid(gridText: "Réponse 1"),
         Grid(gridText: "Réponse 2"),
         Grid(gridText: "Réponse 3"),]
    
    @Published var currentGrid: Grid?
}

struct DropViewDelegate: DropDelegate {
    
    var grid: Grid
    var gridData: GridViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        ///To never disappear drag item when dropped outside
        //gridData.currentGrid = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        
        let fromIndex = gridData.gridItems.firstIndex { (grid) -> Bool in
            return grid.id == gridData.currentGrid?.id
        } ?? 0
        
        let toIndex = gridData.gridItems.firstIndex { (grid) -> Bool in
            return grid.id == self.grid.id
        } ?? 0
        
        if fromIndex != toIndex{
            withAnimation(.default){
                let fromGrid = gridData.gridItems[fromIndex]
                gridData.gridItems[fromIndex] = gridData.gridItems[toIndex]
                gridData.gridItems[toIndex] = fromGrid
            }
        }
    }
    
    // setting Action as Move...
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
