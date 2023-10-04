//
//  ContentView.swift
//  FLAMES
//
//  Created by Dharaneswaran G on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName: String = ""
    @State private var secondName: String = ""
    @State private var result: String = ""
    var body: some View {
        
        VStack(spacing: 30) {
            
            Spacer()
            Spacer()
            
            textField(name: $firstName)
            textField(name: $secondName)
            

            Spacer()
            
            Button("FLAMES"){
                let resultString = check(n1: firstName, n2: secondName)
                print(resultString,resultString.count)
                let res = counting(count: resultString.count)
                
                switch res{
                case 0:
                    print("FRIEND")
                case 1:
                    print("LOVE")
                case 2:
                    print("AFFECTION")
                case 3:
                    print("MARRIAGE")
                case 4:
                    print("ENEMY")
                case 5:
                    print("SISTER")
                default:
                    print("ERROR")
                }
            }
            Spacer()
        }
        .padding()
        .ignoresSafeArea()
    }
    
    
    
    func check(n1: String, n2: String) -> String{
        var name1 = n1.lowercased()
        var name2 = n2.lowercased()
        for char in name1{
            for cha in name2 {
                if char == cha {
                    let firstIndex = name1.firstIndex(of: char) ?? name1.endIndex
                    let firstNextIndex = name1.index(after: firstIndex)
                    let secondIndex = name2.firstIndex(of: cha) ?? name2.endIndex
                    let secondNextIndex = name1.index(after: secondIndex)
                    var dum = name1[..<firstIndex] + name1[firstNextIndex..<name1.endIndex]
                    name1 = String(dum)
                    dum = name2[..<secondIndex] + name2[secondNextIndex..<name2.endIndex]
                    name2 = String(dum)
                    break
                }
            }
        }
        return name1+name2
    }
    
    func counting(count: Int) -> Int{
        var flames = [0,1,2,3,4,5]
        var i = 0
        var co = 1
        while flames.count != 1{
            if co == count {
                co = 1
                flames.remove(at: i)
            }else{
                i = (i + 1) % flames.count
                co = co + 1
            }
        }
        return flames[0]
    }
    
}

struct textField:  View{
    var name: Binding<String>
    
    var body: some View{
        TextField("Enter name",text: name)
            .padding()
            .border(.black, width: 2)
            .font(.title)
            .bold()
    }
}

#Preview {
    ContentView()
}
