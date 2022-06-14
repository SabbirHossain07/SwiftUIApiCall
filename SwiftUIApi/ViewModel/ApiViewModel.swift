//
//  ApiViewModel.swift
//  SwiftUIApi
//
//  Created by Sopnil Sohan on 12/6/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var courses: Course?
    @Published var filter: String = ""
    func fetchData() {
        guard let url = URL(string: "https://clinicaltables.nlm.nih.gov/fhir/R4/ValueSet/icd10cm/$expand?filter=(\(filter)&_format=json&count=500") else {
            print("URL Error")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //Convert to JSON
            do {
                let courses = try JSONDecoder().decode(Course.self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                    print(courses)
                }
            }
            catch {
                print(error.localizedDescription)
                print("error")
            }
        }
        task.resume()
    }
}
