//
//  UsersView.swift
//  57.Pr12.SwiftDataProject
//
//  Created by Валентин on 14.07.2025.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
             
                Spacer()
                
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: addSample)
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        //создаем запрос на получение записей из БД
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func addSample() {
        let user1 = User(name: "Петр Ильич", city: "Москва", joinDate: .now)
        let job1 = Job(name: "Организовать уборку носков", priority: 3)
        let job2 = Job(name: "Встретиться с Алексом", priority: 4)
        
        modelContext.insert(user1)  //добавим пользователя в БД
        
        //добавим ему задачи
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder:  [SortDescriptor(\User.name)])  //по умолчанию сортировка по имени
        .modelContainer(for: User.self)
}
