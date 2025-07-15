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
            Text(user.name)
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
