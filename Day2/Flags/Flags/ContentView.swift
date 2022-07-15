//
//  ContentView.swift
//  Flags
//
//  Created by HyunMin Cho on 2022/07/12.
//

import SwiftUI

//func lighterColor(color: Color) {
//    color ........
//    return color
//}

extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Nations.continents, id: \.region) { continent in
                    Section(header: Text(continent.region)) {
                        ForEach(continent.countries, id: \.name) { c in
                            NavigationLink(destination: {
                                CountryDetailView(country: c)
                            }) {
                                CountryView(country: c) //추상화
                            }
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle()) // PlainListstyle()
            .navigationBarTitle("Countries")
        }
        .onAppear {
            let color = UIColor.blue
            UINavigationBar.appearance().barTintColor = color
            UINavigationBar.appearance().backgroundColor = color
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CountryView: View {
    var country: (name: String, file: String)
    var body: some View {
        HStack {
            Image(country.file)
                .resizable()
                .frame(width: 30, height: 30)
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.blue)
                Text("\(country.name.count) million people")
                    .font(.footnote)
                    .foregroundColor(Color.green)
            }
        }
    }
}

struct CountryView_Preview: PreviewProvider {
    static var previews: some View {
        List {
            CountryView(country: Nations.continents[0].countries[0])
            CountryView(country: Nations.continents[0].countries[1])
        }
//        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
//            CountryView(country: Nations.continents[0].countries[item])
//        }
    }
}
