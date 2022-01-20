//
//  DueDateInputView.swift
//  AI App Prototype
//
//  Created by Chuck Zumbaugh on 3/25/21.
//

import SwiftUI

extension Date {
    func calculateDaysBetween(now firstDate: Date, then secondDate: Date) -> Int {
        return Int((secondDate.timeIntervalSince(firstDate) / 86400).rounded())
    }
}

struct DueDateInputView: View {
    let calculator = AICalculator()
    @State private var dueDate: Date = Date()
    @State private var dateBred: String?
    @State private var currentDate: Date = Date()
    @State private var daysUntilCalving: Int?
    
    var body: some View {
        VStack {
            Text("Estimated date bred")
                .font(.title).fontWeight(.bold)
            List {
                Section(content: {
                    DatePicker("Due Date", selection: $dueDate,
                               displayedComponents: [.date])
                        .onChange(of: dueDate, perform: { value in
                            dateBred = calculator.calculateBredDate(from: value)
                            
                            daysUntilCalving = dueDate.calculateDaysBetween(now: currentDate, then: value)
                        })
                    DatePicker("Current Date", selection: $currentDate, displayedComponents: [.date])
                        .onChange(of: currentDate, perform: { value in
                            daysUntilCalving = currentDate.calculateDaysBetween(now: value, then: dueDate)
                        })
                })
                Section(content: {
                    HStack {
                        Text("Date bred:")
                        Text("\(dateBred ?? "")")
                    }
                    HStack {
                        Text("Days until calving:")
                        Text("\(daysUntilCalving ?? 0)")
                    }
                })
            }}
    }
}


struct DueDateInputViewPreview: PreviewProvider {
    static var previews: some View {
        DueDateInputView()
    }
}
