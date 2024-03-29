//
//  HomePlaylistView.swift
//  Music
//
//  Created by Shotaro Hirano on 2021/08/25.
//

import SwiftUI

struct GridItem_Title_SubTitle_Image_View: View {
    @State var image: UIImage = UIImage(systemName: "photo") ?? UIImage()
    let titleName: String
    let subTitleName: String
    let imageURL: URL?
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: image)
                .resizable()
                .padding(.all, 0.0)
                .aspectRatio(1, contentMode: .fit)
            Text(titleName)
                .lineLimit(2)
                .padding(.horizontal, 10.0)
                .padding(.bottom, 1.0)
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(Color(.label))
                .frame(height: 35)
                
            Text(subTitleName)
                .lineLimit(1)
                .font(.system(size: 11, weight: .light, design: .default))
                .padding(.horizontal, 10.0)
                .foregroundColor(Color(.label))
        }
        .padding(.bottom, 10.0)
        .onAppear {
            DispatchQueue.global().async { 
                if let url = imageURL {
                    downloadImageAsync(url: url) { image in
                        self.image = image ?? UIImage()
                    }
                }
            }
        }
    }
}

struct HomePlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        let playlist = PlayListModel.mock(1)
        GridItem_Title_SubTitle_Image_View(
            titleName: playlist.name,
            subTitleName: playlist.creatorName,
            imageURL: playlist.imageURL
        )
    }
}
