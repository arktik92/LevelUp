//
//  Game2.swift
//  LevelUp
//
//  Created by Laura LONG on 11/06/2021.
//
import AVFoundation
import SwiftUI

struct Game2: View {
    @Binding var StartGame: Bool
    @State private var sonValidate: AVAudioPlayer?
    var myGameDrag : Game
    @Binding var isValidateWin : Bool
    @Binding var isValidateLose : Bool
    @Binding var popUpIsActive: Bool
    @State private var rotationPlanet = false
    @StateObject var gridData = GridViewModel()
    var gameSolution = [3,1,2]
    
    let rows = Array(repeating: GridItem(.flexible(), spacing: 10), count: 1)
    
    var body: some View {
        let pathValidate = Bundle.main.path(forResource: "SonValidation.mp3", ofType:nil)!
        let urlValidate = URL(fileURLWithPath: pathValidate)
        ZStack {
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
                            .clipShape(Circle())
                            .frame(width: 200, height: 200, alignment: .center)
                        
                        
                        Text(myGameDrag.gameDescription)
                            .font(.custom("SFUIDisplay-Light", size: 18))
                            .foregroundColor(Color("bleuNuit"))
                            .multilineTextAlignment(.center)
                            .padding(.leading, 40)
                            .padding(.trailing, 40)
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
                
                Spacer().frame(height:40)
                Button(action: {
                    
                   // popUpIsActive.toggle()
                    
                    do {
                        sonValidate = try AVAudioPlayer(contentsOf: urlValidate)
                        sonValidate?.play()
                    } catch {
                        // couldn't load file :(
                    }
                    
                    if gameSolution == gridData.gridItems.map({$0.gridID}){
                        isValidateWin.toggle()
                    }else{
                        isValidateLose.toggle()
                    }
                    
                    
                }, label: {
                    Rectangle()
                        .foregroundColor(Color("violet"))
                        .clipShape(Capsule())
                        .frame(width: 200, height: 50, alignment: .center)
                        .overlay(
                        Text("Valider")
                            .foregroundColor(.white)
                        )
                })
            }
       
        }.navigationBarHidden(true)
        
        
    }
}

struct Game2_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GameBackground(gamePlanet: PLANET1, gameTitle: "La science dans le quotidien")
            Game2(StartGame: .constant(true), myGameDrag: GAME1, isValidateWin: .constant(false), isValidateLose: .constant(false), popUpIsActive: .constant(true))
        }
    }
}

struct Grid: Identifiable {
    var gridID : Int
    var id = UUID().uuidString
    var gridText: String
}
class GridViewModel: ObservableObject {
    @Published var gridItems =
        [Grid(gridID: 1, gridText: "Jus d'Orange"),
         Grid(gridID: 2, gridText: "Curaçao"),
         Grid(gridID: 3, gridText: "Sirop de canne"),]
    
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
