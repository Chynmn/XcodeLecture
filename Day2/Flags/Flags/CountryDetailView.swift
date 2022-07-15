//
//  CountryDetailView.swift
//  Flags
//
//  Created by HyunMin Cho on 2022/07/13.
//

import SwiftUI

struct CountryDetailView: View {
    var country: (name: String, file: String)
    var body: some View {
        List {
            Image("\(country.file)")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            Text("\(country.name)")
            HStack {
                Text("Population")
                Text("\(country.name.count) million")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                // leading 왼쪽 맞춤, trailing 오른쪽 맞춤
            } .font(.headline)
            HStack {
                Text("Per Capital Income")
                Text("$\(country.file.count * 13)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            ForEach(0 ..< country.name.count) { index in
                let si = country.name.startIndex
                let ei = country.name.index(si, offsetBy: index+1)
                let subs = String(country.name[si ..< ei])
                Text("Item \(index+1) : \(subs)")
            }
        }
        .navigationTitle(country.name)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Nations.continents[0].countries[0])
    }
}
