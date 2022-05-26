//
//  ContentView.swift
//  Shared
//
//  Created by Cully, Allison on 5/16/22.
//
import SwiftUI



struct ContentView: View {
    @StateObject var ticTacToeModel = TicTacToeModel()
    @State var gameOver : Bool = false
    
    func buttonAction(_ index : Int) {
        _ = self.ticTacToeModel.makeMove(index: index, player: .home)
        self.gameOver = self.ticTacToeModel.gameOver.1
    }
    
    var body: some View {
      
        VStack {
            Text("X's and O's")
                .bold()
            
            //Text = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
                .foregroundColor(Color(hue: 10.466, saturation: 6.727, brightness: 7.704))
                .background(Color.green.opacity(0.3).cornerRadius(10))
                .padding(.bottom)
                .font(.title2)
            ForEach(0 ..< ticTacToeModel.squares.count / 3, content: {
                row in
                HStack {
                    ForEach(0 ..< 3, content: {
                        column in
                        let index = row * 3 + column
                        SquareView(dataSource: ticTacToeModel.squares[index], action: {self.buttonAction(index)})
                    })
                }
            })
        }.alert(isPresented: self.$gameOver, content: {
            Alert(title: Text("Game Over"),
                  message: Text(self.ticTacToeModel.gameOver.0 != .empty ? self.ticTacToeModel.gameOver.0 == .home ? "Congrats, you won!": "Take the L." : "Tie" ) , dismissButton: Alert.Button.destructive(Text("Press ok to play again"), action: {
                    self.ticTacToeModel.resetGame()
                
                  }))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



    

