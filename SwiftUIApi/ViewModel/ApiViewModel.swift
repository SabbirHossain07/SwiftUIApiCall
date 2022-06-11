//
//  ApiViewModel.swift
//  SwiftUIApi
//
//  Created by Sopnil Sohan on 12/6/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func fetchData() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            print("URL Error")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //Convert to JSON
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print("error")
            }
        }
        task.resume()
    }
}
