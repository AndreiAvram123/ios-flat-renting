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
            SearchBar(
                navigateToSearch: {
                    
                }
            ).padding([.top], spaceMedium)
            RentOrBuyToggle(showPropertiesToRent: {
                
            }, showPropertiesToBuy: {
                
            })
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
                .opacity(0.8)
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

private struct SearchBar: View {
    @State private var currentQuery = ""
    var navigateToSearch: () -> Void

    var body: some View {
        HStack {
            HStack {
                Image(R.image.searchIcon)
                TextField("Search..", text : $currentQuery,
                          prompt: Text("Search...").foregroundColor(.black))
                .font(.custom(R.font.sfProDisplayRegular, size: textMedium))
                .padding([.leading],spaceSmall)
                
            }.padding(spaceSmallPlus)
        }.background(Color(R.color.primaryBackground))
            .cornerRadius(spaceMedium).onTapGesture {
                navigateToSearch()
            }
    }
    
    
}


private struct RentOrBuyToggle: View {
    var showPropertiesToRent: () -> Void
    var showPropertiesToBuy: () -> Void
    var body: some View {
        HStack {
            HStack(spacing: spaceSmall) {
                ToggleOption(optionName: R.string.localizable.home_screen_toggle_option_rent(),
                             isSelected: true) {
                    showPropertiesToRent()
                }
                Spacer()
                ToggleOption(optionName: R.string.localizable.home_screen_toggle_option_rent()) {
                    showPropertiesToRent()
                }
            }.padding(spaceSmallPlus)
        }.background(Color(R.color.primaryBackground))
            .cornerRadius(largeCornerRadius)

    }
}

private struct ToggleOption: View {
    var optionName: String
    var isSelected: Bool = false
    var onOptionSelected: () -> Void
    var body: some View {
        let textColor = if (isSelected) {
            Color.white
        } else {
            Color.gray
        }
        
        let backgroundColor = if (isSelected) {
            Color.purple
        } else {
            Color.clear
        }
        
        VStack {
            Text(optionName)
                .padding([.top, .bottom], spaceSmallPlus)
                .padding([.leading, .trailing], spaceXLarge)
                .font(.custom(R.font.sfProDisplayRegular, size: textMedium))
                .foregroundStyle(textColor)
                .onTapGesture {
                    onOptionSelected()
                }
        }.background(backgroundColor).cornerRadius(largeCornerRadius)
    }
}

#Preview {
    HomeScreen()
}
