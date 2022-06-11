//
//  Home.swift
//  SwiftUIApi
//
//  Created by Sopnil Sohan on 12/6/22.
//

import SwiftUI

struct Home: View {
    @StateObject var viewMolde = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewMolde.courses, id: \.self) { course in
                    HStack {
                        URLImage(urlString: course.image, data: nil)
                            
                        Text(course.name)
                            .bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewMolde.fetchData()
            }
        }
    }
}

struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        }
        else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchD()
                }
        }
    }
    
    private func fetchD() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
