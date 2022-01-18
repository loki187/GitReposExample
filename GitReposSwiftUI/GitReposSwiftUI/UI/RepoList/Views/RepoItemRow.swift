//
//  RepoItemRow.swift
//  GitReposSwiftUI
//
//  Created by Andrej Lukes on 16/01/2022.
//

import SwiftUI

struct RepoItemRow: View {
    
    var item: GitRepository
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if (item.owner.avatarUrlFormatted != nil) {
                    AsyncImage(
                        url: item.owner.avatarUrlFormatted!,
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    ).frame(maxWidth: 50, maxHeight: 50)
                }
                VStack(alignment: .leading) {
                    Text("\(item.stargazersCount) stars")
                    Text("\(item.updatedAt)")
                }.font(.subheadline)
            }
            Spacer()
            VStack {
                Text("\(item.fullName)")
                    .font(.headline)
                    .fontWeight(.bold)
                if (item.desc != nil) {
                    Text("\(item.desc!)")
                        .font(.subheadline)
                }
            }
        }.padding()
    }
}

struct RepoItemRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoItemRow(item: GitRepository.mockedData[0])
            .previewLayout(.fixed(width: 300, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
