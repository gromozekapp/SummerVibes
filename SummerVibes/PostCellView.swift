//
//  PostCellView.swift
//  SummerVibes
//
//  Created by Daniil Zolotarev on 24.08.24.
//

import SwiftUI

struct PostCellView: View {
    var model: PostModel
    @State var isLiked: Bool = false
    @State var isScaled: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack (alignment: .topTrailing) {
                Image(uiImage: model.image)
                    .resizable()
                    .scaledToFit()
                Image(systemName: "heart.fill")
                    .font(.title)
                    .foregroundColor(isLiked ? .red : .gray)
                    .scaleEffect(isScaled ? 2 : 1)
                    .padding()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            isLiked.toggle()
                        }
                        withAnimation(.easeInOut(duration: 0.5).repeatCount(3,autoreverses: true)) { isScaled.toggle()
                        }
                    }
            }
        VStack(alignment: .leading){
            Text(model.title)
                .font(.headline)
                .foregroundColor(.primary)
            HStack {
                Text(model.author)
                Spacer()
                Text(model.date)
            }
        }
        .padding()
        
    }
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 20))
 }
}

struct PostCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PostCellView(model: PostModel(
                image: UIImage(named: "firstCat")!,
                title: "about do you think wish do first step to IT",
                text: "",
                author: "anton1",
                date: "07.07.2023"
            )
         )
            .shadow(radius: 20)
            .padding()
            Spacer()
        }
    }
}

//#Preview {
//    PostCellView()
//}
