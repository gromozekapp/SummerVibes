//
//  SinglePostView.swift
//  SummerVibes
//
//  Created by Daniil Zolotarev on 24.08.24.
//

import SwiftUI

struct SinglePostView: View {
    var post: PostModel
    var isLinked: Bool = false
    
    var body: some View {
        VStack {
            title
            ScrollView {
                VStack(spacing: 0) {
                    ImageContent
                    textContent
                }
            }
        }
    }
    
    private var title: some View {
        Text(post.title)
            .font(.title)
            .multilineTextAlignment(.center)
    }
    
    private var ImageContent: some View {
        ZStack(alignment: .topTrailing) {
            Image(uiImage: post.image)
                .resizable()
                .scaledToFit()
            VStack {
                VStack {
                    Image(systemName: "heart.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }.padding()
        }
    }
    
    private var textContent: some View {
        VStack {
            Text(post.text)
                .font(.title)
                .multilineTextAlignment(.center)
        }
    }
}

struct SinglePostView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePostView(post: feed[1])
    }
}
