//
//  UsersView.swift
//  57.Pr12.SwiftDataProject
//
//  Created by Валентин on 14.07.2025.
//

import SwiftData
import SwiftUI

struct UsersView: View {
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
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        //создаем запрос на получение записей из БД
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder:  [SortDescriptor(\User.name)])  //по умолчанию сортировка по имени
        .modelContainer(for: User.self)
}
