//
//  WaterSlider.swift
//  HeelFuel
//
//  Created by William Wang on 4/21/23.
//

//MARK: View that displays the amount of water the user has drank

import SwiftUI

struct WaterSlider: View {
    @Binding var maxHeight: CGFloat
    @Binding var sliderProgress: CGFloat
    @Binding var sliderHeight: CGFloat
    @Binding var lastDragValue: CGFloat
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(Color.blue)
                    .opacity(0.15)

                Rectangle()
                    .fill(Color.blue)
                    .frame(height: sliderHeight)
                    .opacity(0.5)

            }.frame(width: 100, height: maxHeight)
                .cornerRadius(35)
                .overlay(
                    Text("\(String(format: "%.1f", sliderProgress * 20)) L")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 18)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical, 30)
                        .offset(y: -maxHeight + UIScreen.main.bounds.height / 5)
                )
                .gesture(DragGesture(minimumDistance: 0).onChanged { value in
                    let translation = value.translation
                    sliderHeight = -translation.height + lastDragValue

                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0

                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight

                    let progress = sliderHeight / maxHeight
                    sliderProgress = progress <= 1.0 ? progress : 1

                }.onEnded { _ in
                    sliderHeight = sliderHeight > maxHeight ? maxHeight : sliderHeight

                    sliderHeight = sliderHeight >= 0 ? sliderHeight : 0

                    lastDragValue = sliderHeight

                })
        }
    }
}

struct WaterSlider_Previews: PreviewProvider {
    static var previews: some View {
        WaterSlider(maxHeight: HomeView().$maxHeight, sliderProgress: HomeView().$sliderProgress, sliderHeight: HomeView().$sliderHeight, lastDragValue: HomeView().$lastDragValue)
    }
}
