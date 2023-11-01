//
//  PropertyCard.swift
//  rent-flats
//
//  Created by Andrei Avram on 27.10.2023.
//

import SwiftUI

struct PropertyDetails {
    var name: String
    var location: String
    var numberOfRooms: Int
    var areaSize: Int
    var pricePerMonth: Int
}

struct PropertyCard: View {
    var propertyDetails: PropertyDetails
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                Image(R.image.placeholder_image)
                    .resizable()
                    .frame(width: 100, height: 200)
                VStack(alignment: .leading) {
                    PropertyCardRating(rating: 3.5, reviewNumber: 20)
                    Text(propertyDetails.name)
                        .font(.custom(R.font.sfProDisplayRegular, size: textMedium))
                    Text(propertyDetails.location)
                        .font(.custom(R.font.sfProDisplayRegular, size: textMedium))
                        .foregroundColor(.gray)
                        .padding([.top], spaceXXSmall)
                    HStack {
                        Text(String(propertyDetails.numberOfRooms))
                            .foregroundStyle(lightTextColor)
                    }
                }
            }.padding([.all], spaceMedium).background(.white)
                .cornerRadius(mediumCornerRadius)
        }
    }
}

private struct PropertyCardRating: View {
    var rating: Double
    var reviewNumber: Int
    private var ratingString: String {
        String(format: "%.1f", rating)
    }
    var body: some View {
        HStack(alignment: .center) {
            Image(R.image.icon_rating)
                .resizable()
                .frame(width: 12, height: 12)
            Text(ratingString)
                .font(.custom(R.font.sfProDisplayRegular, size: textSmall))
            Text("(\(ratingString))")
                .font(.custom(R.font.sfProDisplayRegular, size: textSmall))
                .foregroundColor(.gray)
        }
    
    }
}

#Preview {
    VStack {
        let propertyDetails = PropertyDetails(
            name: "Entire Bromo mountain view Cabin in Surabaya",
            location: "Malang",
            numberOfRooms: 2,
            areaSize: 50,
            pricePerMonth: 500
        )
        PropertyCard(propertyDetails: propertyDetails).padding(spaceMedium)
    }.background(.cyan)
}
