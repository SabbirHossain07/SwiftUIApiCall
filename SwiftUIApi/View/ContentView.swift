//
//  ContentView.swift
//  SwiftUIApi
//
//  Created by Sopnil Sohan on 12/6/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack {
            HStack{
                TextField("Search Here", text: $vm.filter)
                Button(action: {
                    vm.fetchData()
                }, label: {
                    Text("Press")
                })
            }
            
            ScrollView {
            if vm.courses?.expansion.total == 0 {
                Text("No Result Found")
            } else {
                    VStack {
                        if vm.courses != nil{
                            ForEach ((vm.courses?.expansion.contains)!, id:\.self){ item in
                                HStack{
                                    Text(item.display!)
                                    Spacer()
                                    Text(item.code!)
                                }
                                Divider()
                                    .padding(.all,10)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
