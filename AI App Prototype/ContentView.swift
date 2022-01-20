//
//  ContentView.swift
//  AI App Prototype
//
//  Created by Chuck Zumbaugh on 3/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var pregCheckDate = Date()
    @State private var firstAiDate = Date()
    @State private var secondAiDate = Date()
    @State private var thirdAiDate = Date()
    @State private var bullsInDate = Date()
    @State private var bullsOutDate = Date()
    @State private var etDate = Date()
    @State private var firstAiAge: Int = 72
    
    let calculator = AICalculator()
    @State var initialState = true
    
    var body: some View {
        
        let ageRangeFromBulls = calculator.calculateFetalAgeRangeFromBulls(pregCheck: pregCheckDate, bullsIn: bullsInDate, bullsOut: bullsOutDate)
        
        let dueDateFromBulls = calculator.calculateDueDateRangeFromBulls(bullsIn: bullsInDate, bullsOut: bullsOutDate)

        VStack {
            Text("Date Entry:")
                .font(.title).bold()
            List {
                Section( content: {
                    DatePicker("Pregnancy check date:", selection: $pregCheckDate,
                               displayedComponents: [.date])
                    DatePicker("First AI Date:",
                               selection: $firstAiDate,
                               displayedComponents: [.date])
                    DatePicker("Second AI Date:",
                               selection: $secondAiDate,
                               displayedComponents: [.date])
                    DatePicker("Third AI Date:",
                               selection: $thirdAiDate,
                               displayedComponents: [.date])
                    DatePicker("Bulls in date:",
                               selection: $bullsInDate,
                               displayedComponents: [.date])
                    DatePicker("Bulls out date:",
                               selection: $bullsOutDate,
                               displayedComponents: [.date])
                    DatePicker("ET date:",
                               selection: $etDate,
                               displayedComponents: [.date])
                })
                Section(content: {
                    VStack(alignment: .leading) {
                        Text("If bred on first AI:")
                            .fontWeight(.bold)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Fetal age:")
                                Text("\(calculator.calculateFetalAge(from: firstAiDate, to: pregCheckDate, withEt: false)) days")
                            }
                            Text("Due date: \((calculator.calculateDueDate(fromDate: firstAiDate, withEt: false)))")
                                .frame(alignment: .trailing)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("If bred on second AI:")
                            .fontWeight(.bold)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Fetal age:")
                                Text("\(calculator.calculateFetalAge(from: secondAiDate, to: pregCheckDate, withEt: false)) days")
                            }
                            Text("Due date: \((calculator.calculateDueDate(fromDate: secondAiDate, withEt: false)))")
                                .frame(alignment: .trailing)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("If bred on third AI:")
                            .fontWeight(.bold)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Fetal age:")
                                Text("\(calculator.calculateFetalAge(from: thirdAiDate, to: pregCheckDate, withEt: false)) days")
                            }
                            Text("Due date: \((calculator.calculateDueDate(fromDate: thirdAiDate, withEt: false)))")
                                .frame(alignment: .trailing)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("If bred by bulls:")
                            .fontWeight(.bold)
                        HStack {
                            Text("Fetal age:")
                            Text("\(ageRangeFromBulls[0]) - \(ageRangeFromBulls[1]) days")
                        }
                        Text("Due date: \((dueDateFromBulls))")
                            .frame(alignment: .trailing)
                    }
                    VStack(alignment: .leading) {
                        Text("If bred by ET:")
                            .fontWeight(.bold)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Fetal age:")
                                Text("\(calculator.calculateFetalAge(from: etDate, to: pregCheckDate, withEt: true)) days")
                            }
                            Text("Due date: \((calculator.calculateDueDate(fromDate: etDate, withEt: true)))")
                                .frame(alignment: .trailing)
                        }
                    }
                })
            }
            .padding(20)
        }.onAppear(perform: {
            if initialState {
                // Method to implement any animations on load
                print("Loaded")
                self.initialState = false
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
