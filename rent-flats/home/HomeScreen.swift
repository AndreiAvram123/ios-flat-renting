//
//  HomeScreen.swift
//  rent-flats
//
//  Created by Andrei Avram on 24.10.2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack(spacing: spaceMedium) {
            HStack {
                Header(location: "Zimbabwe")
                Spacer()
            }
            Spacer()
        }.padding(spaceMedium)
    }
}

private struct Header: View {
    var location: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(R.string.localizable.home_screen_header_find_your_place)
                .font(.custom(R.font.sfProDisplayRegular, size: textMedium))
            HStack {
                Image(R.image.locationPin)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(location)
                    .padding([.top], spaceXXSmall)
                    .font(.custom(R.font.sfProDisplayRegular, size: textLarge))
            }
        }
    }
}


#Preview {
    HomeScreen()
}
