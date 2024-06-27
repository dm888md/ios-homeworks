//
//  Post.swift
//  Navigation
//
//  Created by Дмитрий on 16.05.2024.
//

import UIKit
// 01 Струкрура поста
public struct MyPost {
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
}


// 02 Создали массив публикаций из 4 х постов
public extension  MyPost {
     static func make () -> [MyPost] {
        [
            MyPost(author: "Author1", description: "Description1", image: "post1", likes: 100, views: 100),
            MyPost(author: "Author2 Author2 Author2 Author2 Author2 Author2 Author2 ", description: "Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 Description2 ", image: "post2", likes: 200, views: 200),
            MyPost(author: "Author3", description: "Description3", image: "post3", likes: 300, views: 300),
            MyPost(author: "Author4", description: "Description4", image: "post4", likes: 400, views: 400)
        ]

    }

}
