//
//  NewsArticleView.swift
//  Stocks
//
//  Created by VT on 10/9/23.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    let newsArticles: [Article]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Top News")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    Text("From News")
                        .foregroundColor(.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                
                Spacer()
            }
            .padding()
            .contentShape(Rectangle())
            .gesture(DragGesture().onChanged(self.onDragBegin).onEnded(self.onDragEnd))
            
            ScrollView {
                VStack {
                    ForEach(self.newsArticles, id: \.title) { article in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .foregroundColor(.white)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                
                                Text(article.title)
                                    .foregroundColor(.white)
                                    .font(.custom("Arial", size: 22))
                            }
                            .padding(10)
                            
                            Spacer()
                            URLImage(URL(string: article.imageURL)!) {image in
                                image.resizable()
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 27.0/255.0, green: 28.0/255.0, blue: 30.0/255.0))
            .cornerRadius(20)
        }
    }
}

//struct NewsArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsArticleView()
//    }
//}
