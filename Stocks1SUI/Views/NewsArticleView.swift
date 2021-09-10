//
//  NewsArticleView.swift
//  Stocks1SUI
//
//  Created by Jorge Encinas on 09/09/21.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newArticles: [NewsArticleViewModel]
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            VStack(alignment: .leading){
                Text("Top News")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text("From News")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                
                ScrollView{
                    VStack{
                        ForEach(newArticles, id: \.title) { article in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(article.publication)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .foregroundColor(.white)
                                        .font(.custom("Arial", size: 22))
                                }
                                Spacer()
                                
                                //URLImage(URL(string: article.imageURL)!, content: {
                                //})
                                
                                URLImage(URL(string: article.imageURL)!, content: { image in
                                    image.resizable()
                                })
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
                
            }
        }.frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255, opacity: 0.9))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "The Bull Market is Charging into 2020", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg", publication: "The Wallstreet Journal")
        
        return NewsArticleView(newArticles: [NewsArticleViewModel(article: article)])
            
    }
}
